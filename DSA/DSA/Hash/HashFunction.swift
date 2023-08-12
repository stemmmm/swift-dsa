//  HashFunction.swift

let m = 1_000_000  // table size

func hash(_ key: Int) -> Int {
    return (m + key % m) % m
}

func hash(_ key: String) -> Int {
    var h = 0
    for char in key {
        h = (h * 1_000 + Int(char.asciiValue!)) % m
    }
    return h
}
