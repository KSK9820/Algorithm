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
            
            array.swapAt(target, index)
            index = target
        }
        return value
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var weights = [Int](repeating: Int.max, count: n+1)
var edges = [[(b: Int, w: Int)]](repeating: [], count: n+1)
var heap = Heap<(b: Int, w: Int)> { $0.w > $1.w }
for i in 0..<m {
    let abw = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, w) = (abw[0], abw[1], abw[2])
    edges[a].append((b,w))
}
let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (ab[0], ab[1])

heap.enheap((a, 0))
weights[a] = 0

while !heap.isEmpty {
    let info = heap.deheap()!
    if info.w > weights[info.b] { continue }
    if info.b == b { break }
    for edge in edges[info.b] {
        let newWeight = info.w + edge.w
        if newWeight < weights[edge.b] {
            weights[edge.b] = newWeight
            heap.enheap((edge.b, newWeight))
        }
    }
}
print(weights[b])
