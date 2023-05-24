//  Permutation.swift

func nextPermutation<T: Comparable>(_ array: inout [T]) -> Bool {
    let count = array.count

    if count < 2 { return false }

    // 배열의 끝부터 시작해서, i 번째 원소가 i - 1 번째 원소보다 큰 첫 번째 위치를 찾음
    var i = count - 1
    while i > 0 && array[i - 1] >= array[i] { i -= 1 }

    if i <= 0 { return false }  // 내림차순으로 정렬돼있으면 가장 마지막 순열이므로 종료

    // 배열의 끝부터 시작해서, i - 1 번째 원소보다 큰 첫 번째 원소를 찾음
    var j = count - 1
    while array[j] <= array[i - 1] { j -= 1 }

    array.swapAt(i - 1, j)

    // i 번째 이후의 원소들 내림차순 정렬
    j = count - 1
    while i < j {
        array.swapAt(i, j)
        i += 1
        j -= 1
    }

    return true
}
