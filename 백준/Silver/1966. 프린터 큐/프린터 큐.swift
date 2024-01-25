let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var priority = Queue<(Int, Int)>()
    var count = 0
    var highestPriority = [Int]()
    let docu = readLine()!.split(separator: " ").map { Int($0)! }
    
    for i in 0..<n {
        let input = docu[i]
        if i == m {
            priority.enqueue((input, 0))
        } else {
            priority.enqueue((input, 1))
        }
        highestPriority.append(input)
    }
    
    highestPriority = highestPriority.sorted(by: <)
    while highestPriority.count != 0 {
        if priority.front!.0 < highestPriority.last! {
            priority.enqueue(priority.dequeue()!)
        } else {
            count += 1
            highestPriority.removeLast()
            let want = priority.dequeue()!
            if want.1 == 0 {
                print(count)
                break
            }
        }
    }
    
}

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var size: Int { input.count + output.count }
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    var front: T? {
        if output.isEmpty {
            return input.first
        }
        return output.last
    }
    
    var back: T? {
        if input.isEmpty {
            return output.first
        }
        return input.last
    }
    
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
