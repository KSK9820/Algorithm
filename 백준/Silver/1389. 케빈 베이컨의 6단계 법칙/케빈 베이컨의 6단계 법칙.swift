import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var bacon = Array(repeating: Array(repeating: 0, count: 0), count: n)
var result = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<m {
    let relation = readLine()!.split(separator: " ").map { Int($0)! - 1}
    bacon[relation[0]].append(relation[1])
    bacon[relation[1]].append(relation[0])
}

for i in 0..<n {
    var visited = [Bool](repeating: false, count: n)
    var q = Queue<Int>()
    q.enqueue(i)
    while true {
        guard let friend = q.dequeue() else { break }
        if visited[friend] == true { continue }
        visited[friend] = true
        for kebin in bacon[friend] {
            if visited[kebin] == true || kebin == i { continue }
            q.enqueue(kebin)
            if result[i][kebin] == 0 {
                result[i][kebin] += result[i][friend] + 1
            }

        }
    }
}

var lastResult = [Int](repeating: 0, count: n)
for i in 0..<n {
    
    lastResult[i] = result[i].reduce(0, +)
}
print(lastResult.firstIndex(of: lastResult.min()!)! + 1)

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