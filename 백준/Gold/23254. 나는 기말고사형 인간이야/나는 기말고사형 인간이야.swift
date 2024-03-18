struct Heap<T> {
    private var array = [T]()
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
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex-1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        
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
    
    var front: T? {
        if array.isEmpty {
            return nil
        }
        return array.first
    }
    var isEmpty: Bool {
        array.isEmpty
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var standard = readLine()!.split(separator: " ").map { Int($0)! }
let plus = readLine()!.split(separator: " ").map { Int($0)! }
var heap = Heap<(n: Int, w: Int)>{ $0.w < $1.w }

var hour = n * 24

var result = 0
for i in 0..<m {
    result += standard[i]
    if 100 - standard[i] != 0 {
        heap.enheap((100 - standard[i], plus[i]))
    }
}
while hour > 0  {
    guard let h = heap.deheap() else { break }
    
    if h.n < h.w {
        heap.enheap((h.n, h.n))
    } else {
        
        heap.enheap((h.n - h.w, h.w))
        hour -= 1
        result += h.w
        
    }
    
}
print(result)
