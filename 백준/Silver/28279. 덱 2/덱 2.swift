struct Deque<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueueBack(_ new: T) {
        input.append(new)
    }
    mutating func enqueueFront(_ new: T) {
        output.append(new)
    }
    
    mutating func dequeueFront() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
    mutating func dequeueBack() -> T? {
        if input.isEmpty {
            input = output.reversed()
            output = []
        }
        return input.popLast()
    }
    
    var count: Int {
        input.count + output.count
    }
    
    mutating func firstElement() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.last
    }
    
    mutating func lastElement() -> T? {
        if input.isEmpty {
            input = output.reversed()
            output = []
        }
        return input.last
    }
}

let n = Int(readLine()!)!
var d = Deque<Int>()
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    switch input[0] {
    case 1:
        d.enqueueFront(input[1])
    case 2:
        d.enqueueBack(input[1])
    case 3:
        if let a = d.dequeueFront() {
            print(a)
        } else {
            print(-1)
        }
    case 4:
        if let a = d.dequeueBack() {
            print(a)
        } else {
            print(-1)
        }
    case 5:
        print(d.count)
    case 6:
        d.count == 0 ? print(1) : print(0)
    case 7:
        if let first = d.firstElement() {
            print(first)
        } else {
            print(-1)
        }
    case 8:
        if let last = d.lastElement() {
            print(last)
        } else {
            print(-1)
        }
    default:
        break
    }
}
