let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)

for i in 0..<n {
    map[i] = readLine()!.map { Int(String($0))! }
}

var q = Queue<(y: Int, x: Int, destroy: Int, count: Int)>()
q.enqueue((0,0,0,1))
var result = -1
let mx = [0,0,1,-1]
let my = [1,-1,0,0]
while true {
    guard let now = q.dequeue() else { break }
    if now.y == n-1 && now.x == m-1 {
        result = now.count
        break
    }
    
    for i in 0..<4 {
        let newx = now.x + mx[i]
        let newy = now.y + my[i]
        
        if newx < 0 || newy < 0 || newx >= m || newy >= n { continue }
        if visited[newy][newx][now.destroy] { continue }
        
        if map[newy][newx] == 1 && now.destroy == 0 {
            visited[newy][newx][1] = true
            q.enqueue((newy, newx, 1, now.count + 1))
        }
        if map[newy][newx] == 0 {
            visited[newy][newx][now.destroy] = true
            q.enqueue((newy, newx, now.destroy, now.count + 1))
        }
    }
}
print(result)

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}