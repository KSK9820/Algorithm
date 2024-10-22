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

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m,n) = (mn[0], mn[1])

var arr = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)
var q = Queue<(y: Int, x: Int)>()
for i in 0..<m {
    arr[i] = readLine()!.map { Int(String($0))! }
}

for i in 0..<n {
    q.enqueue((0,i))
    visited[0][i] = true
}
        

let mx = [0,0,-1,1]
let my = [1,-1,0,0]
var result = "NO"
while true {
    guard let now = q.dequeue() else { break }
    if now.y == m-1 { result = "YES"; break }
    
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newy >= m || newx < 0 || newx >= n { continue }
        if visited[newy][newx] { continue }
        if arr[newy][newx] == 1 { continue }
        visited[newy][newx] = true
        q.enqueue((newy, newx))
    }
}

print(result)