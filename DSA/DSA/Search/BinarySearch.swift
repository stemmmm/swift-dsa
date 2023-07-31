//  BinarySearch.swift

func binarySearch<T: Comparable>(_ arr: [T], _ target: T) -> Int? {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if arr[mid] == target { return mid }
        else if arr[mid] > target { high = mid - 1 }
        else { low = mid + 1 }
    }
    
    return nil
}

func binarySearch<T: Comparable>(_ arr: [T], _ range: Range<Int>, _ target: T) -> Int? {
    let mid = (range.lowerBound + range.upperBound) / 2

    if range.lowerBound >= range.upperBound { return nil }

    if arr[mid] == target { return mid }
    else if arr[mid] > target { return binarySearch(arr, range.lowerBound ..< mid, target) }
    else { return binarySearch(arr, mid + 1 ..< range.upperBound, target) }
}

// target 값을 삽입할 수 있는 최소 인덱스
func lowerBound<T: Comparable>(_ arr: [T], _ target: T) -> Int {
    var low = 0
    var high = arr.count
    
    while low < high {
        let mid = (low + high) / 2
        if arr[mid] >= target { high = mid }
        else { low = mid + 1 }
    }
    
    return low
}

// target 값을 삽입할 수 있는 최대 인덱스
func upperBound<T: Comparable>(_ arr: [T], _ target: T) -> Int {
    var low = 0
    var high = arr.count
    
    while low < high {
        let mid = (low + high) / 2
        if arr[mid] > target { high = mid }
        else { low = mid + 1 }
    }
    
    return low
}
