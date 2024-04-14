let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var city = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

for i in 0..<m {
    city[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var q = Queue<(y: Int, x: Int)>()
q.enqueue((0,0))

var mx = [1, 0]
var my = [0, 1]
var result = "No"
while true {
    guard let now = q.dequeue() else { break }
    if now.y == m-1 && now.x == n-1 {
        result = "Yes"
        break
    }
    
    if visited[now.y][now.x] { continue }
    visited[now.y][now.x] = true
    
    for i in 0..<2 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy >= m || newx >= n { continue }
        if city[newy][newx] == 0 { continue }
        if visited[newy][newx] { continue }
        
        q.enqueue((newy, newx))
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