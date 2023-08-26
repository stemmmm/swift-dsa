//  Stack.swift

struct Stack<Element> {
    private var array: [Element] = []
    
    var size: Int { array.count }
    var isEmpty: Bool { array.isEmpty }
    var top: Element? { array.last }

    mutating func push(_ newElement: Element) { array.append(newElement) }
    mutating func pop() -> Element { array.removeLast() }
}
