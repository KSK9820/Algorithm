let c = Int(readLine()!)!
var result = [Int]()
for _ in 0..<c {
    let st = readLine()!.split(separator: " ").map { Int($0)! }
    var q = Queue<(s: Int, t: Int, count: Int)>()
  
    q.enqueue((st[0], st[1], 0))
    while !q.isEmpty {
        let info = q.dequeue()!
  
        if info.s == info.t {
            result.append(info.count)

            break
        }
        
        if info.s * 2 <= info.t + 3 {
            q.enqueue((info.s * 2, info.t + 3, info.count + 1))
        }
        if info.s + 1 <= info.t {
            q.enqueue((info.s + 1, info.t, info.count + 1))
        }
    }
}
print(result.map { String($0) }.joined(separator: "\n"))
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
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}
