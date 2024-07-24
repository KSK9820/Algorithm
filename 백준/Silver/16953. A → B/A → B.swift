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

let ab = readLine()!.split(separator: " ").map { Int($0)! }
var (a,b) = (ab[0],ab[1])
var q = Queue<(Int, Int)>()
q.enqueue((a,0))

while true {
    guard let now = q.dequeue() else {
        print(-1)
        break
    }
    if now.0 == b {
        print(now.1+1)
        break
    }
    if now.0 * 2 <= b {
        q.enqueue((now.0 * 2, now.1+1))
    }
    if now.0 * 10 + 1 <= b {
        q.enqueue((now.0 * 10 + 1, now.1+1))
    }
}
