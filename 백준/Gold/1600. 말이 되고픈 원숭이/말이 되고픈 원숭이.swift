let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map { Int($0)! }
let (w, h) = (wh[0], wh[1])

var trip = Array(repeating: Array(repeating: 0, count: w), count: h)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: k+1), count: w), count: h)
for i in 0..<h {
    trip[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var q = Queue<(y: Int, x: Int, move: Int, k: Int)>()
q.enqueue((0,0,0,k))
visited[0][0][k] = true

let mx = [1, -1, 0, 0]
let my = [0, 0, -1, 1]
let hx = [-2, -1, -2, -1, 1, 2, 1, 2]
let hy = [-1, -2, 1, 2, -2, -1, 2, 1]

var result = -1
var steps = 0
while true {
    guard let m = q.dequeue() else { break }
    if m.y == h-1 && m.x == w-1 {
        result = m.move
        break
    }
    
    for i in 0..<4 {
        let newy = m.y + my[i]
        let newx = m.x + mx[i]
        
        if newy < 0 || newx < 0 || newy >= h || newx >= w { continue }
        if trip[newy][newx] == 1 { continue }
        if visited[newy][newx][m.k] { continue }
        visited[newy][newx][m.k] = true
        
        q.enqueue((newy, newx, m.move + 1, m.k))
    }
    
    if m.k > 0 {
        for i in 0..<8 {
            let newy = m.y + hy[i]
            let newx = m.x + hx[i]
            
            if newy < 0 || newx < 0 || newy >= h || newx >= w { continue }
            if trip[newy][newx] == 1 { continue }
            if visited[newy][newx][m.k-1] { continue }
            visited[newy][newx][m.k-1] = true
            q.enqueue((newy, newx, m.move + 1, m.k-1))
        }
    }
}
print(result)

struct Queue<T> {
    private var output = [T]()
    private var input = [T]()
    
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