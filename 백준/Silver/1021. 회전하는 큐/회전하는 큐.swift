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


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var num = readLine()!.split(separator: " ").map { Int($0)! }
var d1 = Deque<Int>()
var d2 = Deque<Int>()
for i in 1...n {
    d1.enqueueBack(i)
    d2.enqueueBack(i)
}

var result = 0
for i in 0..<m {
    var r1 = 0
    var r2 = 0
    
    while true {
        if num[i] == d1.firstElement() {
            d1.dequeueFront()
            break
        }
            
        guard let dequeue = d1.dequeueFront() else { break }
        d1.enqueueBack(dequeue)
        r1 += 1
    }
    
    while true {
        if num[i] == d2.firstElement() {
            d2.dequeueFront()
            break
        }
        
        guard let dequeue = d2.dequeueBack() else { break }
        d2.enqueueFront(dequeue)
        r2 += 1
    }
    
    if r1 < r2 {
        d2 = d1
        result += r1
    } else {
        d1 = d2
        result += r2
    }
}
print(result)
