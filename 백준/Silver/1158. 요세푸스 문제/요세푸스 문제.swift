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
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var arr = Queue<Int>()
for i in 1...n {
    arr.enqueue(i)
}
var result = "<"

var i = 1
while !arr.isEmpty {
    let de = arr.dequeue()!
    if i % k == 0 {
        result += "\(String(de)), "
    } else {
        arr.enqueue(de)
    }
    i += 1
}
result.removeLast()
result.removeLast()
print(result + ">")