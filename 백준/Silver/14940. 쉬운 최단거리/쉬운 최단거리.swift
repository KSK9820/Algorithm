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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var result = Array(repeating: Array(repeating: Int.max, count: m), count: n)
var q = Queue<(y: Int, x: Int, c: Int)>()
for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<m {
        if map[i][j] == 2 {
            q.enqueue((i,j,0))
            result[i][j] = 0
        }
        if map[i][j] == 0 {
            result[i][j] = 0
        }
    }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

while true {
    guard let now = q.dequeue() else { break }

    for i in 0..<4 {
        let newx = now.x + mx[i]
        let newy = now.y + my[i]
        
        if newx < 0 || newy < 0 || newx >= m || newy >= n { continue }
        if map[newy][newx] == 0 { continue }
        if result[newy][newx] <= now.c + 1 { continue }
        result[newy][newx] = now.c + 1
        q.enqueue((newy, newx, now.c + 1))
    }
}

for i in 0..<n {
    print(result[i].map { $0 == Int.max ? String(-1) : String($0) }.joined(separator: " "))
}
