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
    
    var lastOne: Bool {
        return input.count + output.count == 1 ? true : false
    }
}

let n = Int(readLine()!)!
var q = Queue<(initial: String, num: Int)>()
for i in 0..<n {
    let input = readLine()!.split(separator: " ")
    q.enqueue((String(input[0]), Int(String(input[1]))!))
}

while !q.lastOne {
    let first = q.dequeue()!
    for i in 0..<first.num-1 {
        let tmp = q.dequeue()!
        q.enqueue(tmp)
    }
    q.dequeue()
}
print(q.dequeue()!.initial)