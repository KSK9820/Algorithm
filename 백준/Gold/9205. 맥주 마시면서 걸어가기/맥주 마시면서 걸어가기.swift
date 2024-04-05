let t = Int(readLine()!)!
var result = [String](repeating: "sad", count: t)
for tt in 0..<t {
    let n = Int(readLine()!)!
    let home = readLine()!.split(separator: " ").map { Int($0)! }
    var convenience = [[Int]](repeating: [], count: n)
    for i in 0..<n {
        convenience[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    let festival = readLine()!.split(separator: " ").map { Int($0)! }
    convenience.append(festival)
    
    var q = Queue<([Int])>()
    q.enqueue(home)
    var visited = [Bool](repeating: false, count: n+1)
    while true {
        guard let now = q.dequeue() else { break }
        if now == festival { result[tt] = "happy"; break }
        for c in 0...n {
            if visited[c] { continue }
            if getDistance(now, convenience[c]) > 1000 { continue }
            q.enqueue(convenience[c])
            visited[c] = true
        }
    }
}

print(result.joined(separator: "\n"))

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

func getDistance(_ d1: [Int], _ d2: [Int]) -> Int {
    return abs(d1[0] - d2[0]) + abs(d1[1] - d2[1])
}
