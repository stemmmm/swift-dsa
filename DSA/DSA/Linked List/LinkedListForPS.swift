//  LinkedListForPS.swift

//let max = 1000005
//var data = [Int](repeating: -1, count: max)  // 값을 담는 배열
//var prev = [Int](repeating: -1, count: max) // 이전 노드의 index를 담는 배열 (-1은 존재하지 않음을 의미)
//var next = [Int](repeating: -1, count: max) // 다음 노드의 index를 담는 배열 (-1은 존재하지 않음을 의미)
//var unused = 1
//
//func traverse() {
//    var cur = next[0]
//
//    while cur != -1 {
//        print(data[cur], terminator: " ")
//        cur = next[cur]
//    }
//    print()
//}
//
//// 주의) insert와 remove의 index는 연결리스트가 아닌 배열의 index를 의미
//func insert(_ newElement: Int, after index: Int) {
//    data[unused] = newElement
//    prev[unused] = index
//    next[unused] = next[index]
//    if next[index] != -1 { prev[next[index]] = unused }
//    next[index] = unused
//    unused += 1
//}
//
//func remove(at index: Int) {
//    next[prev[index]] = next[index];
//    if next[index] != -1 { prev[next[index]] = prev[index] }
//}
