struct Queue<T> {
    var output = [T]()
    var input = [T]()
    
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

let n = Int(readLine()!)!
var rc = readLine()!.split(separator: " ").map { Int($0)! }

var f = (y: rc[0], x: rc[1])
var e = (y: rc[2], x: rc[3])


let my = [-2,-2,0,0,2,2]
let mx = [-1,1,-2,2,-1,1]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = -1

var q = Queue<(y: Int, x: Int, c: Int)>()
q.enqueue((f.y, f.x, 0))
visited[f.y][f.x] = true

while true {
    guard let now = q.dequeue() else { break }
    
    if (now.y, now.x) == (e.y, e.x) { result = now.c; break }
    
    for i in 0..<6 {
        let newx = now.x + mx[i]
        let newy = now.y + my[i]
        
        if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
        if visited[newy][newx] { continue }
        
        visited[newy][newx] = true
        q.enqueue((newy, newx, now.c + 1))
    }
}
print(result)
