//  SelectionSort.swift

extension Array where Element: Comparable {
    func selectionSorted() -> [Element] {
        var arr = self
        
        for i in 0 ..< arr.count {
            var idx = i
            for j in idx + 1 ..< arr.count {
                if arr[idx] > arr[j] { idx = j }
            }
            if i != idx { arr.swapAt(i, idx) }
        }
        
        return arr
    }
}
