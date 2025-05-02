

struct Heap<T> {
    var arr = [T]()
    let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(arr[childIndex], arr[parentIndex]) {
            arr.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast()}
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < arr.count && compare(arr[leftChildIndex], arr[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && compare(arr[rightChildIndex], arr[target]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
    
    var count: Int {
        arr.count
    }
        
}

var answer = ""
for _ in 0..<Int(readLine()!)! {
    let m = Int(readLine()!)!
    var arr = [Int]()
    
    while arr.count < m {
        arr += readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    var upper = Heap<Int>(compare: <)
    var lower = Heap<Int>(compare: >)
    var middle = arr[0]
    var result = [arr[0]]
    
    for i in 1..<m {
        if arr[i] < middle {
            lower.enheap(arr[i])
            upper.enheap(middle)
        } else {
            upper.enheap(arr[i])
            lower.enheap(middle)
        }
        
        if (upper.count + lower.count) % 2 == 0 {
            middle = lower.deheap()!
        } else {
            middle = upper.deheap()!
        }
        
        if i % 2 == 0 {
            result.append(middle)
        }
    }
    
    answer += "\(result.count)\n"
    for i in 0..<result.count {
        answer += "\(result[i]) "
        if i % 10 == 9 && i != result.count - 1 {
            answer += "\n"
        }
    }
    answer += "\n"
}

print(answer)
