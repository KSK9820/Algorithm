
struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    mutating func enqueue(_ new: T) {
        input.append(new)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}

let my  = [0,0,-1,1]
let mx  = [1,-1,0,0]

var b = Array(repeating: Array(repeating: 0, count: 5), count: 5)
for i in 0..<5 {
    b[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c) = (rc[0], rc[1])

var q = Queue<(y: Int, x: Int, c: Int)>()
q.enqueue((r,c,0))

var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
visited[r][c] = true
var result = -1
while true {
    guard let now = q.dequeue() else { print(-1); break }
    if b[now.y][now.x] == 1 { print(now.c); break }
    
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newx < 0 || newy >= 5 || newx >= 5 { continue }
        if visited[newy][newx] { continue }
        if b[newy][newx] == -1 { continue }
        visited[newy][newx] = true
        q.enqueue((newy, newx, now.c + 1))
    }
}

