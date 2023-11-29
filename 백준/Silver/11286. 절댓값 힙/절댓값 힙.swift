struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(array: [T] = [T](), by compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty {
            return nil
        }
        if array.count == 1 {
            return array.removeLast()
        }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if target == index {
                break
            }
            
            array.swapAt(target, index)
            index = target
        }
        return value
    }
    
    var peek: T? {
        if array.isEmpty {
            return nil
        }
        return array[0]
    }
}


var positive = Heap<Int>(by: <)
var negative = Heap<Int>(by: >)
var result = ""

let n = Int(readLine()!)!
for _ in 0..<n {
    let x = Int(readLine()!)!
    
    if x > 0 {
        positive.enheap(x)
    } else if x < 0 {
        negative.enheap(x)
    } else {
        
        let positiveX = positive.peek
        let negativeX = negative.peek
        
        if positiveX == nil && negativeX == nil {
            result += "0\n"
        } else if positiveX == nil && negativeX != nil {
            result += "\(negative.deheap()!)\n"
        } else if positiveX != nil && negativeX == nil {
            result += "\(positive.deheap()!)\n"
        } else if abs(positiveX!) < abs(negativeX!) {
            result += "\(positive.deheap()!)\n"
        } else {
            result += "\(negative.deheap()!)\n"
        }
    }
}

print(result)