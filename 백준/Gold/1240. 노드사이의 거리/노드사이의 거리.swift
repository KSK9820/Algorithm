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
let (n, m) = (nm[0], nm[1])

typealias edge = (d: Int, w: Int)
var edges = [[edge]](repeating: [], count: n+1)

for i in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges[input[0]].append((input[1], input[2]))
    edges[input[1]].append((input[0], input[2]))
}
var result = ""
for i in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var q = Queue<edge>()
    var visited = Array(repeating: false, count: n+1)
    
    q.enqueue((input[0], 0))
    
    while true {
        guard let now = q.dequeue() else { break }
        if now.d == input[1] { result += "\(now.w)\n"; break }
        
        for j in edges[now.d] {
            if visited[j.d] { continue }
            visited[j.d] = true
            q.enqueue((j.d, j.w + now.w))
        }
    }
}
print(result)