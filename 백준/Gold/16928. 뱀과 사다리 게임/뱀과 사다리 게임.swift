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
    var size: Int { input.count + output.count }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var game = [Int](repeating: -1, count: 101)
for i in 0..<n+m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    game[input[0]] = input[1]
}

var visited = [Bool](repeating: false, count: 101)
var q = Queue<(now: Int, count: Int)>()
q.enqueue((count: 0, now: 1))
while true {
    let out = q.dequeue()!
    if out.now >= 100 { print(out.count); break }
    visited[out.now] = true
    for i in 1...6 {
        var next = out.now + i
        if next > 100 { continue }
        if game[next] != -1 {
            if visited[game[next]] == false {
                q.enqueue((game[next], out.count + 1))
            }
        } else {
            if visited[next] == false {
                q.enqueue((next, out.count + 1))
            }
        }
    }
}