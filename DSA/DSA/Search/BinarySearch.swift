//  BinarySearch.swift

func binarySearch<T: Comparable>(_ arr: [T], _ target: T, _ range: Range<Int>) -> Int? {
    let mid = (range.lowerBound + range.upperBound) / 2
    
    if range.lowerBound > range.upperBound { return nil }
    
    if arr[mid] == target { return mid }
    else if arr[mid] > target { return binarySearch(arr, target, range.lowerBound ..< mid) }
    else { return binarySearch(arr, target, mid + 1 ..< range.upperBound) }
}
