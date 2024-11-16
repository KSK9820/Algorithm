struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        
        return output.popLast()
    }
}

typealias Coord = (y: Int, x: Int, c: Int)
let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var miro = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    miro[input[0]][input[1]] = -1
}

var q = Queue<Coord>()
q.enqueue((0,0,0))

let mx = [[-1,0,1,0,-1,-1], [0,1,1,1,0,-1]]
let my = [[-1,-1,0,1,1,0], [-1,-1,0,1,1,0]]

while true {
    guard let now = q.dequeue() else { print(-1); break }
    if now.x == m-1 && now.y == n-1 { print(now.c); break }
    
    for i in 0..<6 {
        let newY = now.y + my[now.y % 2][i]
        let newX = now.x + mx[now.y % 2][i]
        
        if newY < 0 || newX < 0 || newX >= m || newY >= n { continue }
        
        if visited[newY][newX] { continue }
        if miro[newY][newX] == -1 { continue }
        
        visited[newY][newX] = true
        q.enqueue((newY, newX, now.c+1))
    }
}