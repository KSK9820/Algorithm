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
let king = String(readLine()!)

var graph = [String: [String]]()
var degree = [String: Int]()
var result = [String: Double]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }

    graph[input[1], default: []].append(input[0])
    graph[input[2], default: []].append(input[0])
    
    degree[input[0], default: 0] += 2
    degree[input[1], default: 0] += 0
    degree[input[2], default: 0] += 0
    
    result[input[0], default: 0.0] = 0.0
    result[input[1], default: 0.0] = 0.0
    result[input[2], default: 0.0] = 0.0
}
result[king] = 1.0

var hubo = [String: Double]()
for _ in 0..<m {
    hubo[String(readLine()!), default: 0] = 0
}

var q = Queue<String>()
for i in degree {
    if i.value == 0 {
        q.enqueue(i.key)
    }
}

while true {
    guard let now = q.dequeue() else { break }
    
    for i in graph[now, default: []] {
        degree[i]! -= 1
        result[i]! += result[now]! / 2
        if degree[i]! == 0 {
            q.enqueue(i)
        }
    }
}

var answer: (String, Double) = ("", 0.0)
for h in hubo {
    if result[h.key, default: 0.0] > answer.1 {
        answer = (h.key, result[h.key]!)
    }
}
print(answer.0)
