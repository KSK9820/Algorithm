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
let ballon = readLine()!.split(separator: " ").map { Int($0)! }

for i in 2...n {
    d.enqueueBack(i)
}
var result = "1 "
var idx = ballon[0]
for _ in 0..<n-1 {
    if idx > 0 {
        for _ in 0..<idx - 1 {
            let a = d.dequeueFront()!
            d.enqueueBack(a)
        }
        let explosion = d.dequeueFront()!
        result.append("\(explosion) ")
        idx = ballon[explosion-1]
    } else {
        
        for _ in 0..<abs(idx)-1 {
            let a = d.dequeueBack()!
            d.enqueueFront(a)
        }
        let explosion = d.dequeueBack()!
        result.append("\(explosion) ")
        idx = ballon[explosion-1]
    }
}

print(result)
