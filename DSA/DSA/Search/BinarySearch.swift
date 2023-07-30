//  BinarySearch.swift

func binarySearch<T: Comparable>(_ arr: [T], _ target: T) -> Int? {
    var left = 0
    var right = arr.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if arr[mid] == target { return mid }
        else if arr[mid] > target { right = mid - 1 }
        else { left = mid + 1 }
    }
    
    return nil
}

func binarySearch<T: Comparable>(_ arr: [T], _ target: T, _ range: Range<Int>) -> Int? {
    let mid = (range.lowerBound + range.upperBound) / 2

    if range.lowerBound > range.upperBound { return nil }

    if arr[mid] == target { return mid }
    else if arr[mid] > target { return binarySearch(arr, target, range.lowerBound ..< mid) }
    else { return binarySearch(arr, target, mid + 1 ..< range.upperBound) }
}

// target 값을 삽입할 수 있는 최소 인덱스
func lowerBound(_ arr: [Int], _ target: Int, _ length: Int) -> Int {
    var left = 0
    var right = length
    
    while left < right {
        let mid = (left + right) / 2
        if arr[mid] >= target { right = mid }
        else { left = mid + 1 }
    }
    
    return left
}

// target 값을 삽입할 수 있는 최대 인덱스
func upperBound(_ arr: [Int], _ target: Int, _ length: Int) -> Int {
    var left = 0
    var right = length
    
    while left < right {
        let mid = (left + right) / 2
        if arr[mid] > target { right = mid }
        else { left = mid + 1 }
    }
    
    return left
}
