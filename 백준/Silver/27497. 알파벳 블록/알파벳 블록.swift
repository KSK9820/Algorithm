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

var d = Deque<(v: String, i: Int)>()
for i in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    switch input[0] {
    case "1":
        d.enqueueBack((input[1], i))
    case "2":
        d.enqueueFront((input[1], i))
    case "3":
        let f = d.outputBack
        let b = d.inputBack
        
        if f == nil && b == nil {
            continue
        } else if f == nil {
            let _ = d.dequeueBack()
            continue
        } else if b == nil {
            let _ = d.dequeueFront()
            continue
        } else {
            if f!.i < b!.i {
                let _ = d.dequeueBack()
            } else {
                let _ = d.dequeueFront()
            }
        }
    default:
        break
    }
}

let result = d.getArr.map { $0.v }.joined()
print(result == "" ? "0" : result)