
struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
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
let (n,m) = (nm[0], nm[1])

var arr = Array(repeating: [Int](), count: n+1)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    arr[ab[0]].append(ab[1])
    arr[ab[1]].append(ab[0])
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let aij = readLine()!.split(separator: " ").map { Int($0)! }
    
    if aij[0] == 1 {
        arr[aij[1]].append(aij[2])
        arr[aij[2]].append(aij[1])
    } else {
        arr[aij[1]].remove(at: arr[aij[1]].firstIndex(of: aij[2])!)
        arr[aij[2]].remove(at: arr[aij[2]].firstIndex(of: aij[1])!)
    }
    
    var q = Queue<Int>()
    var visited = Array(repeating: -1, count: n+1)
    q.enqueue(1)
    visited[1] = 0
    
    while true {
        guard let now = q.dequeue() else { break }
        
        for i in arr[now] where visited[i] == -1 {
            visited[i] = visited[now] + 1
            q.enqueue(i)
        }
    }

    result += "0 \(visited[2...n].map { String($0) }.joined(separator: " "))\n"
}
print(result)
