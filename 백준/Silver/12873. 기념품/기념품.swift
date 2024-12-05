import Foundation

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
var q = Queue<Int>()

for i in 1...n {
    q.enqueue(i)
}

var idx = 1
outer: while q.count > 1 {
    let p = q.count
    let range = idx*idx*idx % p == 0 ? p : idx*idx*idx % p
    for _ in 1..<range {
        guard let now = q.dequeue() else { break outer }
        q.enqueue(now)
    }
    let _ = q.dequeue()
    idx += 1
}
print(q.dequeue()!)
