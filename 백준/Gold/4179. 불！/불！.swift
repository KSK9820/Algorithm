let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])
var miro = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
var jihun = Queue<(y: Int, x: Int, c: Int)>()
var fire = Queue<(y: Int, x: Int)>()

for i in 0..<r {
    miro[i] = Array(readLine()!.map { String($0) })
    for j in 0..<c {
        if miro[i][j] == "J" {
            jihun.enqueue((i, j, 1))
            visited[i][j] = true
        }
        if miro[i][j] == "F" {
            fire.enqueue((i, j))
        }
    }
}


var result = "IMPOSSIBLE"
let mx = [-1,1,0,0]
let my = [0,0,1,-1]

outer: while true {
    if jihun.isEmpty { break }
    
    var tmpFire = Queue<(y: Int, x: Int)>()
    while true {
        guard let f = fire.dequeue() else { fire = tmpFire; break }
        for i in 0..<4 {
            let newx = f.x + mx[i]
            let newy = f.y + my[i]
            if newx < 0 || newy < 0 || newx >= c || newy >= r { continue }
            
            if miro[newy][newx] != "#" && miro[newy][newx] != "F" {
                miro[newy][newx] = "F"
                tmpFire.enqueue((newy, newx))
            }
        }
    }
    
    var tmpJ = Queue<(y: Int, x: Int, c: Int)>()
    while true {
        guard let now = jihun.dequeue() else { jihun = tmpJ;  break }
        if now.x == c-1 || now.y == r-1 || now.x == 0 || now.y == 0 {
            result = "\(now.c)"
            break outer
        }
        for i in 0..<4 {
            let newx = now.x + mx[i]
            let newy = now.y + my[i]
            
            if newx < 0 || newy < 0 || newx >= c || newy >= r { continue }
            if miro[newy][newx] == "." && !visited[newy][newx] {
                visited[newy][newx] = true
                tmpJ.enqueue((newy, newx, now.c + 1))
            }
        }
    }

}
print(result)

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
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