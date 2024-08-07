

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
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

let n = Int(readLine()!)!
let arr = readLine()!.map { String($0) }
var q = Queue<String>()
var opq = Queue<String>()

var cflag = true
for i in arr {
    if i == "C" {
        cflag = false
    }
    q.enqueue(i)
}


var result = ""
if !cflag {
    var num1 = 0
    var num2 = 0
    
    while true {
        guard let now = q.dequeue() else { break }
        
        if let number = Int(now) {
            if opq.isEmpty {
                num1 = num1 * 10 + number
            } else {
                num2 = num2 * 10 + number
            }
        } else {
            if opq.isEmpty{
                opq.enqueue(now)
            } else {
                guard let op = opq.dequeue() else { break }
                opq.enqueue(now)
                num1 = calculate(num1, op, num2)
                num2 = 0
            }
        }
        
    }
    if !opq.isEmpty {
        num1 = calculate(num1, opq.dequeue()!, num2)
        num2 = 0
    }
    print(result)
} else {
    print("NO OUTPUT")
}


func calculate(_ num1: Int, _ op: String, _ num2: Int) -> Int {
    switch op {
    case "S":
        return num1 - num2
    case "M":
        return num1 * num2
    case "U":
        return num1 / num2
    case "P":
        return num1 + num2
    case "C":
        result += "\(num1) "
        return num1
    default:
        return 0
    }
}
