let abnm = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, n, m) = (abnm[0], abnm[1], abnm[2], abnm[3])

var bridge = [Int](repeating: 0, count: 100001)
var visited = [Bool](repeating: false, count: 100001)
var q = Queue<(location: Int, count: Int)>()
q.enqueue((n, 0))
var move = [-1, 1, -a, -b, a, b]
var move2 = [a, b]

while true {
    guard let now = q.dequeue() else { break }

    if now.location == m {
        print(now.count)
        break
    }
    
    if visited[now.location] { continue }
    visited[now.location] = true
    
    for i in 0..<6 {
        let new = now.location + move[i]
        if new < 0 || new > 100000 { continue }
        if visited[new] { continue }
        q.enqueue((new, now.count + 1))
    }
    
    for i in 0..<2 {
        let new = now.location * move2[i]
        if new < 0 || new > 100000 { continue }
        if visited[new] { continue }
        q.enqueue((new, now.count + 1))
    }
}

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