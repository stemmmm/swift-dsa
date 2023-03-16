//  main.swift

var list = LinkedList<Int>()

for i in 1 ... 5 { list.append(i) }
list.remove(at: 2)
list.insert(100, at: 2)

for i in 0 ..< list.count { print(list[i].value, terminator: " ") }
