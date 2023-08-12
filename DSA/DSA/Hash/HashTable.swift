//  HashTable.swift

struct HashTable<Key: Hashable, Value> {
    private var keys: [Key?]
    private var values: [Value?]
    private var capacity: Int
    
    init(capacity: Int) {
        self.keys = [Key?](repeating: nil, count: capacity)
        self.values = [Value?](repeating: nil, count: capacity)
        self.capacity = capacity
    }
    
    // 주어진 키의 해시 값을 계산하고, linear probing 방식으로 적절한 인덱스를 찾은 뒤, 리턴함
    private func index(forKey key: Key) -> Int {
        var probingIndex = 0
        let hashIndex = abs(key.hashValue) % capacity
        
        while keys[(hashIndex + probingIndex) % capacity] != nil {
            if keys[(hashIndex + probingIndex) % capacity] == key {
                return (hashIndex + probingIndex) % capacity
            }
            probingIndex += 1
        }
        
        return (hashIndex + probingIndex) % capacity
    }
    
    subscript(key: Key) -> Value? {
        get {
            let index = index(forKey: key)
            return values[index]
        }
        set(newValue) {
            if let value = newValue {
                let index = index(forKey: key)
                keys[index] = key
                values[index] = value
            } else {
                remove(key: key)
            }
        }
    }
    
    private mutating func remove(key: Key) {
        let index = index(forKey: key)
        keys[index] = nil
        values[index] = nil
    }
}
