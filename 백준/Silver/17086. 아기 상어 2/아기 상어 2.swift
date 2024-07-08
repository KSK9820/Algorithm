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
    
    mutating func removeAll() {
        output = [T]()
        input = [T]()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var shark = [(y: Int, x: Int)]()
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<m {
        if arr[i][j] == 1 {
            shark.append((i, j))
        }
    }
}

let mx = [0, 0, -1, 1, 1, 1, -1, -1]
let my = [1, -1, 0, 0, -1, 1, 1, -1]
var q = Queue<(y: Int, x: Int, c: Int)>()

var result = 0
for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 0 {
            q.enqueue((i, j, 0))
        } else {
            continue
        }
        visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var count = 0
        var distance = Int.max
        while count < shark.count {
            guard let now = q.dequeue() else { break }
            if arr[now.y][now.x] == 1 {
                distance = min(distance, now.c)
                count += 1
            }
            
            for i in 0..<8 {
                let newy = now.y + my[i]
                let newx = now.x + mx[i]
                
                if newy >= n || newy < 0 || newx >= m || newx < 0 { continue }
                if visited[newy][newx] { continue }
                visited[newy][newx] = true
                q.enqueue((newy, newx, now.c + 1))
            }
            
        }
        q.removeAll()
        result = max(result, distance)
    }
}
print(result)

