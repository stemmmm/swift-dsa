//  Node.swift

class Node<T> {
    var value: T
    var next: Node?
    weak var prev: Node?
    
    init(value: T, next: Node? = nil, prev: Node? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}
