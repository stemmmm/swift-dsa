//  HeapSort.swift

func heapify(_ arr: inout [Int], _ n: Int, _ i: Int) {  // n: 배열의 크기
    var largestIdx = i     // 현재 루트 노드의 인덱스
    let lcIdx = 2 * i + 1  // 현재 루트 노트에 대한 왼쪽 자식 노드의 인덱스
    let rcIdx = 2 * i + 2  // 현재 루트 노트에 대한 오른쪽 자식 노드의 인덱스
    
    if lcIdx < n && arr[lcIdx] > arr[largestIdx] { largestIdx = lcIdx }
    if rcIdx < n && arr[rcIdx] > arr[largestIdx] { largestIdx = rcIdx }
    
    if largestIdx != i {
        arr.swapAt(i, largestIdx)
        heapify(&arr, n, largestIdx)
    }
}

func heapSort(_ arr: inout [Int]) {
    let n = arr.count
    
    // 최대 힙 생성 - O(n)
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        heapify(&arr, n, i)
    }
    
    for i in stride(from: n - 1, through: 1, by: -1) {
        arr.swapAt(0, i)     // 가장 큰 원소를 배열의 끝으로 이동
        heapify(&arr, i, 0)  // arr[0 ... i - 1]까지 다시 heapify
    }
}

