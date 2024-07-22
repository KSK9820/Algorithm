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
let my  = [0,0,-1,1]
let mx  = [1,-1,0,0]
let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { Int(String($0))! }
}
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: k+1)
var q = Queue<(y: Int, x: Int, c: Int, f: Int)>()
q.enqueue((0,0,0,0))
visited[0][0][0] = true
var result = -1
while true {
    guard let now = q.dequeue() else { break }
    if now.y == n-1 && now.x == m-1 {
        result = now.c+1
        break
    }
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy<0 || newy>=n || newx<0 || newx>=m { continue }
        if visited[now.f][newy][newx] { continue }
        visited[now.f][newy][newx] = true
        if arr[newy][newx] == 0 {
            q.enqueue((newy, newx, now.c+1, now.f))
        } else {
            if now.f < k {
                q.enqueue((newy, newx, now.c+1, now.f+1))
            }
        }
    }
}

print(result)