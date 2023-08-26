//  Deque.swift

struct Deque<Element> {
    private var array: [Element?]
    private var capacity: Int
    private var frontIndex: Int
    
    // nil로 이루어진 배열 생성
    init(capacity: Int = 100) {
        array = [Element?](repeating: nil, count: capacity)
        self.capacity = capacity
        frontIndex = capacity
    }
    
    var count: Int { array.count - frontIndex }
    var isEmpty: Bool { count == 0 }
    
    var front: Element? { array[frontIndex] }
    var back: Element? { array.last! }
    
    mutating func pushFront(_ newElement: Element) {
        // 더 이상 front에 추가할 수 없으면 -> nil로 이루어진 새로운 배열 앞에 추가
        if frontIndex == 0 {
            capacity *= 2
            let extend = [Element?](repeating: nil, count: capacity)
            array.insert(contentsOf: extend, at: 0)
            frontIndex = capacity
        }
        
        frontIndex -= 1
        array[frontIndex] = newElement
    }
    
    mutating func pushBack(_ newElement: Element) { array.append(newElement) }
    
    mutating func popFront() -> Element? {
        let element = array[frontIndex]
        array[frontIndex] = nil
        frontIndex += 1
        return element
    }
    
    mutating func popBack() -> Element? { array.removeLast() }
}

