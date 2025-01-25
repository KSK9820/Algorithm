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
    
    var inputBack: T? {
        input.last
    }
    
    var outputBack: T? {
        output.last
    }
    
    var getArr: [T] {
        return output.reversed() + input
    }
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    var d1 = Deque<String>()
    var d2 = Deque<String>()
    
    let input = readLine()!.map { String($0) }
    for i in input {
        if i == "<" {
            if let a = d1.dequeueBack() {
                d2.enqueueFront(a)
            }
        } else if i == ">" {
            if let a = d2.dequeueFront() {
                d1.enqueueBack(a)
            }
        } else if i == "-" {
            _ = d1.dequeueBack()
        } else {
            d1.enqueueBack(i)
        }
    }
    
    result.append("\(d1.getArr.joined() + d2.getArr.joined())\n")
}
print(result)
