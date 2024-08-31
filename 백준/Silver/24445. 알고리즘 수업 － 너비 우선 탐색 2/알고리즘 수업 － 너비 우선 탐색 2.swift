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

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])

var graph = Array(repeating: [Int](), count: n+1)
for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    graph[uv[0]].append(uv[1])
    graph[uv[1]].append(uv[0])
}

for i in 1...n {
    graph[i] = graph[i].sorted(by: >)
}

var visited = Array(repeating: false, count: n+1)
var q = Queue<Int>()
q.enqueue(r)
visited[r] = true

var count = 1
var result = Array(repeating: 0, count: n+1)
while true {
    guard let now = q.dequeue() else { break }
    result[now] = count
    count += 1
    for i in graph[now] {
        if visited[i] { continue }
        visited[i] = true
        q.enqueue(i)
    }
}
result.removeFirst()
print(result.map { String($0)}.joined(separator: "\n") )
