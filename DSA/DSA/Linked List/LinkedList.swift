//  LinkedList.swift

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }
    
    var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    subscript(index: Int) -> Node<T> {
        guard index >= 0 && index < count else { fatalError("Index out of range") }
        
        var node = head
        for _ in 0 ..< index { node = node?.next }
        
        return node!
    }
    
    
    func append(_ newElement: T) {
        let newNode = Node(value: newElement, next: nil, prev: tail)
        
        if let tail { tail.next = newNode }
        else { head = newNode }
        
        tail = newNode
    }
    
    func insert(_ newElement: T, at index: Int) {
        guard index >= 0 && index <= count else { fatalError("Index out of range") }
        
        guard !isEmpty else {
            self.append(newElement)
            return
        }

        if index == 0 {
            let newNode = Node(value: newElement, next: self[index], prev: nil)
            self[index].prev = newNode
            head = newNode
        } else if index == self.count {
            let newNode = Node(value: newElement, next: nil, prev: self[index - 1])
            self[index - 1].next = newNode
            tail = newNode
        } else {
            let newNode = Node(value: newElement, next: self[index], prev: self[index - 1])
            self[index - 1].next = newNode
            self[index].prev = newNode
        }
    }
    
    func remove(at index: Int) {
        guard !isEmpty || index >= 0 && index < count else { fatalError("Index out of range") }
        
        if index == 0 {
            head = self[1]
            head?.prev = nil
        } else if index == self.count - 1 {
            tail = self[index - 1]
            tail?.next = nil
        } else {
            self[index + 1].prev = self[index - 1]
            self[index - 1].next = self[index + 1]
        }
    }
}
