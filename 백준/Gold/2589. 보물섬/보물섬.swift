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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var zido = Array(repeating: Array(repeating: "", count: m), count: n)
for i in 0..<n {
    zido[i] = readLine()!.map { String($0) }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]
var result = 0
for y in 0..<n {
    for x in 0..<m {
        if zido[y][x] == "L" {
            var visited = Array(repeating: Array(repeating: false, count: m), count: n)
            var q = Queue<(y: Int, x: Int, c: Int)>()
            q.enqueue((y,x,0))
            visited[y][x] = true
            while true {
                guard let now = q.dequeue() else { break }
                
                for i in 0..<mx.count {
                    let newx = now.x + mx[i]
                    let newy = now.y + my[i]
                    
                    if newx < 0 || newy < 0 || newx >= m || newy >= n { continue }
                    if visited[newy][newx] { continue }
                    if zido[newy][newx] == "W" { continue }
                    visited[newy][newx] = true
                    q.enqueue((newy, newx, now.c + 1))
                    result = max(result, now.c+1)
                }
            }
        }
    }
}
print(result)
