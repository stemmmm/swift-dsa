//  SelectionSort.swift

extension Array where Element: Comparable {
    mutating func selectionSort() -> [Element] {
        for i in 0 ..< self.count {
            var idx = i
            for j in idx + 1 ..< self.count {
                if self[idx] > self[j] { idx = j }
            }
            if i != idx { self.swapAt(i, idx) }
        }
        return self
    }
}
