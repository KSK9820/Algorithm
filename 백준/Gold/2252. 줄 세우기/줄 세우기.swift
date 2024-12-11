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
var degree = [Int](repeating: 0, count: n+1)
var graph = [[Int]](repeating: [], count: n+1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[ab[0]].append(ab[1])
    degree[ab[1]] += 1
}

var q = Queue<Int>()
for i in 1...n {
    if degree[i] == 0 {
        q.enqueue(i)
    }
}

var result = ""
while true {
    guard let now = q.dequeue() else { break }
    
    for i in graph[now] {
        degree[i] -= 1
        if degree[i] == 0 {
            q.enqueue(i)
        }
    }
    
    result += "\(now) "
}
print(result)
