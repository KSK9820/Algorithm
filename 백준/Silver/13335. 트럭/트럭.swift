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
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}

let nwl = readLine()!.split(separator: " ").map { Int($0)! }
let (n,w,l) = (nwl[0], nwl[1], nwl[2])
let a = readLine()!.split(separator: " ").map { Int($0)! }

var q = Queue<Int>()
var idx = 0
var weight = 0
var time = 1
while idx < n {
    if weight + a[idx] <= l {
        q.enqueue(a[idx])
        weight += a[idx]
        idx += 1
    } else {
        q.enqueue(0)
    }
    
    if q.count == w {
        weight -= q.dequeue()!
    }
    time += 1
}
print(time + w - 1)