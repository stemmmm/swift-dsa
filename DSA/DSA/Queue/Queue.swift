//  Queue.swift

struct Queue<T> {
    private var array: [T?] = []
    private(set) var frontIndex = 0  // 삭제가 일어나는 끝
    
    var front: T? { array[frontIndex] }
    var rear: T? { array[array.endIndex - 1] }
    
    var size: Int { array.count - frontIndex }
    var isEmpty: Bool { size == 0 }
    
    mutating func push(_ newElement: T) { array.append(newElement) }
    
    mutating func pop() -> T? {
        let element = array[frontIndex]
        
        array[frontIndex] = nil
        frontIndex += 1
        
        // 배열의 25% 이상이 비었다면 -> 남은 원소들 앞으로 당겨줌
        if Double(frontIndex) / Double(array.count) * 100 >= 25 {
            array.removeSubrange(0 ..< frontIndex)
            frontIndex = 0
        }
        
        return element
    }
}
