//  InsertionSort.swift

extension Array where Element: Comparable {
    mutating func insertionSort() -> [Element] {
        for i in 1 ..< self.count {
            var j = i
            while j > 0 && self[j] < self[j - 1] {
                self.swapAt(j, j - 1)
                j -= 1
            }
        }
        return self
    }
}
