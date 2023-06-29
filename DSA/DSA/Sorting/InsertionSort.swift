//  InsertionSort.swift

extension Array where Element: Comparable {
    func insertionSorted() -> [Element] {
        var arr = self
        
        for i in 1 ..< arr.count {
            var j = i
            while j > 0 && arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
                j -= 1
            }
        }
        
        return arr
    }
}

