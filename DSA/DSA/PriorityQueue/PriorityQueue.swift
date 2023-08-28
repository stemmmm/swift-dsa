//  Heap.swift

struct PriorityQueue<Element: Comparable> {
    private var heap: [Element] = []
    
    var isEmpty: Bool { heap.isEmpty }
    var size: Int { heap.count }
    
    var peek: Element? { heap.first }
    
    private func parentIndex(of index: Int) -> Int { (index - 1) / 2 }    // 부모 노드의 인덱스를 리턴
    private func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }   // 왼쪽 자식 노드의 인덱스를 리턴
    private func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }  // 오른쪽 자식 노드의 인덱스를 리턴
    
    mutating func insert(_ element: Element) {
        heap.append(element)
        var currentIdx = heap.count - 1
        var parentIdx = parentIndex(of: currentIdx)
        
        // 부모 노드의 값과 비교하며 위로 올라감
        while currentIdx > 0 && heap[parentIdx] > heap[currentIdx] {
            heap.swapAt(parentIdx, currentIdx)
            currentIdx = parentIdx
            parentIdx = parentIndex(of: currentIdx)
        }
    }
    
    mutating func delete() -> Element? {
        guard !isEmpty else { return nil }
        
        if heap.count == 1 { return heap.removeLast() }
        
        let root = heap[0]
        heap[0] = heap.removeLast()
        
        var curIdx = 0
        
        // 자식 노드의 값과 비교하며 아래로 내려감
        while true {
            let lcIdx = leftChildIndex(of: curIdx)
            let rcIdx = rightChildIndex(of: curIdx)
            var targetIdx = curIdx
            
            if lcIdx < heap.count && heap[lcIdx] < heap[targetIdx] { targetIdx = lcIdx }
            if rcIdx < heap.count && heap[rcIdx] < heap[targetIdx] { targetIdx = rcIdx }
            if targetIdx == curIdx { break }
            
            heap.swapAt(targetIdx, curIdx)
            curIdx = targetIdx
        }
        
        return root
    }
}
