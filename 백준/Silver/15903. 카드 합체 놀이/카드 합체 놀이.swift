let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let input = readLine()!.split(separator: " ").map { Int($0)! }

struct Heap<T> {
    var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
            array.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = (childIndex-1) / 2
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
            if leftChildIndex < array.count && compare(array[target], array[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[target], array[rightChildIndex]) {
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
}

var heap = Heap<Int>(compare: >)
for i in 0..<n {
    heap.enheap(input[i])
}
for _ in 0..<m {
    let first = heap.deheap()!
    let second = heap.deheap()!
    heap.enheap(first + second)
    heap.enheap(first + second)
}
var result = 0
for _ in 0..<n {
    result += heap.deheap()!
}
print(result)