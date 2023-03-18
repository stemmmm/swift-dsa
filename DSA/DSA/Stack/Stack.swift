//  Stack.swift

struct Stack<T> {
    private var array: [T] = []
    
    var size: Int { array.count }
    var isEmpty: Bool { array.isEmpty }
    var top: T? { array.last }
    
    mutating func push(_ newElement: T) { array.append(newElement) }
    mutating func pop() -> T { array.removeLast() }
}
