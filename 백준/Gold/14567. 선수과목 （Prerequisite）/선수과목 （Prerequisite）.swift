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


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [], count: n+1)
var degree = Array(repeating:0, count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[input[0]].append(input[1])
    degree[input[1]] += 1
}

var q = Queue<(n: Int, c: Int)>()

var result = [Int](repeating: 0, count: n+1)
for i in 1...n {
    if degree[i] == 0 {
        q.enqueue((i,1))
        result[i] = 1
    }
}
while true {
    guard let now = q.dequeue() else { break }
    
    for i in graph[now.n] {
        degree[i] -= 1
        
        if degree[i] == 0 {
            q.enqueue((i, now.c + 1))
            result[i] = now.c + 1
        }
    }
}
result.removeFirst()
print(result.map { String($0) }.joined(separator: " "))
