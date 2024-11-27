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
}
struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count-1
        var parentIndex = (childIndex-1) / 2
        
        while childIndex > 0 && compare(arr[parentIndex], arr[childIndex]) {
            arr.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = (childIndex-1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        var index = 0
        
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            
            if leftChildIndex < arr.count && compare(arr[target], arr[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && compare(arr[target], arr[rightChildIndex]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var fee = Array(repeating: 0, count: n+1)
for i in 1...n {
    fee[i] = Int(readLine()!)!
}
var weight = Array(repeating: 0, count: m+1)
for i in 1...m {
    weight[i] = Int(readLine()!)!
}

var parking = Array(repeating: 0, count: m+1)

var empty = Heap<Int>(compare: >)
for i in 1...n {
    empty.enheap(i)
}
var pay = 0
var waiting = Queue<Int>()
for _ in 0..<2*m {
    let car = Int(readLine()!)!
    
    if car > 0 {
        guard let carin = empty.deheap() else {
            waiting.enqueue(car)
            continue
        }
        parking[car] = carin
    } else {
        let carout = parking[abs(car)]
        pay += fee[carout] * weight[abs(car)]
        empty.enheap(carout)
        if let w = waiting.dequeue() {
            let carin = empty.deheap()!
            parking[w] = carin
        }
    }
}
print(pay)