//  MergeSort.swift

let n = 10
var arr = [15, 25, 22, 357, 16, 23, -53, 12, 46, 3]
var tmp = [Int](repeating: -1, count: n)

// arr[st ..< mid]와 arr[mid ..< en]이 정렬되어 있을 때, arr[st ..< mid]와 arr[mid ..< en]를 합치는 함수
func merge(_ st: Int, _ en: Int) {
    let mid = (st + en) / 2
    var lIdx = st
    var rIdx = mid
    
    for i in st ..< en {
        if rIdx == en {
            tmp[i] = arr[lIdx]
            lIdx += 1
        } else if lIdx == mid {
            tmp[i] = arr[rIdx]
            rIdx += 1
        } else if arr[lIdx] <= arr[rIdx] {
            tmp[i] = arr[lIdx]
            lIdx += 1
        } else {
            tmp[i] = arr[rIdx]
            rIdx += 1
        }
    }
    
    for i in st ..< en { arr[i] = tmp[i] }
}

// arr[st ..< en]을 정렬하는 함수
func mergeSort(_ st: Int, _ en: Int) {
    if en == st + 1 { return }
    
    let mid = (st + en) / 2
    mergeSort(st, mid)  // arr[st ..< mid] 정렬
    mergeSort(mid, en)  // arr[mid ..< en] 정렬
    merge(st, en)       // 정렬된 arr[st ..< mid]와 arr[mid ..< en] 병합
}
