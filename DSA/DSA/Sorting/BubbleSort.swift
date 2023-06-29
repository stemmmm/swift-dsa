//  BubbleSort.swift

extension Array where Element: Comparable {
//    func bubbleSorted() -> [Element] {
//        var arr = self
//
//        for i in 0 ..< arr.count - 1 {
//            for j in 0 ..< arr.count - 1 - i {
//                if arr[j] > arr[j + 1] { arr.swapAt(j, j + 1) }
//            }
//        }
//
//        return arr
//    }
    
    // Early stopping
    func bubbleSorted() -> [Element] {
        var arr = self
        var swapped = false
        
        for i in 0 ..< arr.count - 1 {
            swapped = false
            for j in 0 ..< arr.count - 1 - i {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                    swapped = true
                }
            }
            if !swapped { break }
        }
        
        return arr
    }
}
