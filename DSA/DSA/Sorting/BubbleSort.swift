//  BubbleSort.swift

extension Array where Element: Comparable {
    mutating func bubbleSort() -> [Element] {
        var swapped = false
        
        for i in 0 ..< self.count - 1 {
            swapped = false
            for j in 0 ..< self.count - 1 - i {
                if self[j] > self[j + 1] {
                    self.swapAt(j, j + 1)
                    swapped = true
                }
            }
            if !swapped { break }
        }
        
        return self
    }
}
