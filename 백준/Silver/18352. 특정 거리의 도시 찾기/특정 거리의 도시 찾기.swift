
let nmkx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k, x) = (nmkx[0], nmkx[1], nmkx[2], nmkx[3])

typealias Edge = (d: Int, w: Int)
var edges = [[Edge]](repeating: [], count: n+1)
var visited = Array(repeating: false, count: n+1)
var queue = Queue<Edge>()

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    edges[ab[0]].append((ab[1], Int.max))
}

var result = [Int]()
queue.enqueue((x, 0))

while true {
    guard let now = queue.dequeue() else { break }
    if visited[now.d] { continue }
    visited[now.d] = true
    
    if now.w == k {
        result.append(now.d)
    }
    
    for i in 0..<edges[now.d].count {
        let edge = edges[now.d][i]
        if visited[edge.d] || edge.w < now.w + 1 { continue }
        edges[now.d][i].w = now.w + 1
        queue.enqueue(edges[now.d][i])
    }
}

result.count == 0 ? print(-1) : print(result.sorted().map { String($0) }.joined(separator: "\n"))

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
