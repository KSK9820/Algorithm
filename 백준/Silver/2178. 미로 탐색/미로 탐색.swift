let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var miro = [[Int]](repeating: [], count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    let input = Array(readLine()!.map { String($0) }).map { Int($0)! }
    miro[i] = input
}
var q = Queue<(y: Int, x: Int, count: Int)>()
q.enqueue((0,0,1))

let mx = [-1, 0, 1, 0]
let my = [0, 1, 0, -1]

while true {
    guard let now = q.dequeue() else { break }
    if now.x == m-1 && now.y == n-1 { print(now.count); break }
    if visited[now.y][now.x] { continue }
    visited[now.y][now.x] = true
    
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]

        if newy >= n || newy < 0 || newx >= m || newx < 0 { continue }
        if visited[newy][newx] || miro[newy][newx] == 0 { continue }

        q.enqueue((newy, newx, now.count + 1))
    }
}



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
