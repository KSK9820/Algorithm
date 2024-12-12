struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        
        return output.popLast()
    }
    
    var count: Int {
        input.count + output.count
    }
}

let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n+1)
var degree = Array(repeating:0, count: n+1)
var t = Array(repeating:0, count: n+1)

for i in 1...n {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    
    t[i] = input[0]

    for j in 1..<input.count-1 {
        graph[input[j]].append(i)
        degree[i] += 1
    }
}

var q = Queue<Int>()
var dp = t
    
for i in 1...n {
    if degree[i] == 0 {
        q.enqueue(i)
    }
}

while true {
    guard let now = q.dequeue() else { break }
    
    for i in graph[now] {
        degree[i] -= 1
        dp[i] = max(dp[i], dp[now] + t[i])
        
        if degree[i] == 0 {
            q.enqueue(i)
        }
    }
}
dp.removeFirst()
print(dp.map { String($0) }.joined(separator: "\n"))