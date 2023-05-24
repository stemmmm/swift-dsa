//  BFSForPS.swift

func bfsForPS() {
    var visited = Array(repeating: [Bool](repeating: false, count: column), count: row)
    visited[0][0] = true  // 시작점 방문 명시
    
    // 탐색 방향 (탐색 순서는 중요 X)
    let dx = [1, 0, -1, 0]  // 행
    let dy = [0, 1, 0, -1]  // 열
    
    var queue: [(Int, Int)] = []
    var front = 0
    queue.append((0, 0))  // 큐에 시작점 삽입
    
    while queue.count != front {
        let (x, y) = queue[front]
        front += 1
        
        for dir in 0 ..< 4 {
            let nx = x + dx[dir]
            let ny = y + dy[dir]
            if nx < 0 || nx >= row || ny < 0 || ny >= column { continue }  // index out of range 예방
            if visited[nx][ny] || board[nx][ny] != 1 { continue }  // 이미 방문했거나 갈 수 없는 곳일 경우
            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
}
