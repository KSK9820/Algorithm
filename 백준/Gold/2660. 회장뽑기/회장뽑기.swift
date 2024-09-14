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

let n = Int(readLine()!)!
var friend = Array(repeating: [Int](), count: n+1)
while true {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b) = (ab[0], ab[1])
    if (a,b) == (-1,-1) { break }
    
    friend[a].append(b)
    friend[b].append(a)
}

var score = Array(repeating: 0, count: n+1)
for i in 1...n {
    var visited = Array(repeating: false, count: n+1)
    var q = Queue<(Int, Int)>()
    q.enqueue((i,0))
    visited[i] = true
    
    while true {
        guard let now = q.dequeue() else { break }
        
        for j in friend[now.0] {
            if visited[j] { continue }
            visited[j] = true
            q.enqueue((j, now.1 + 1))
            score[i] = now.1 + 1
        }
    }
    
}


let result = score[1...n].min()!
let ppl = score.enumerated().filter { $0.element == result }

print("\(result) \(ppl.count)")
print(ppl.map { String($0.offset) }.joined(separator: " "))