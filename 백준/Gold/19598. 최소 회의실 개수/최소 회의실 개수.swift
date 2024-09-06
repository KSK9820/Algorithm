struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        array.append(new)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
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
            
            if target == index { break }
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
    
    var first: T {
        return array.first!
    }
    var count: Int {
        return array.count
    }
}

let n = Int(readLine()!)!
var council = [(s: Int, e: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    council.append((input[0], input[1]))
}
council = council.sorted { $0.e < $1.e }.sorted { $0.s < $1.s }
var h = Heap<Int>(compare: >)
h.enheap(council[0].e)

for i in 1..<n {
    if h.first <= council[i].s {
        h.deheap()
        h.enheap(council[i].e)
    } else {
        h.enheap(council[i].e)
    }
    
}
print(h.count)
