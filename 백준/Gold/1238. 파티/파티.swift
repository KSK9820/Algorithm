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
        var parentIndex = (childIndex - 1 ) / 2
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func dequeue() -> T? {
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
    
    mutating func removeAll() {
        array.removeAll()
    }
}


let nmx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, x) = (nmx[0], nmx[1], nmx[2])


var edges = [[(v: Int, w: Int)]](repeating: [], count: n+1)

for i in 0..<m {
    let nmw = readLine()!.split(separator: " ").map { Int($0)! }
    edges[nmw[0]].append((nmw[1], nmw[2]))
}

//go party
var result = [Int](repeating: 0, count: n)
for i in 1...n {
    if i == x { continue }
    var heap = Heap<(v: Int, w: Int)> { $0.w > $1.w }
    var weights = [Int](repeating: Int.max, count: n+1)
    heap.enheap((i, 0))
    
    while !heap.isEmpty {
        let info = heap.dequeue()!
        if info.w > weights[info.v] { continue }
        if info.v == x { break }
        
        for edge in edges[info.v] {
            let newWeight = info.w + edge.w
            if newWeight < weights[edge.v] {
                weights[edge.v] = newWeight
                heap.enheap((edge.v, newWeight))
            }
        }
    }
    result[i-1] += weights[x]
    heap.removeAll()
    heap.enheap((x,0))
    weights = [Int](repeating: Int.max, count: n+1)
    while !heap.isEmpty {
        let info = heap.dequeue()!
        if info.w > weights[info.v] { continue }
        if info.v == i { break }
        
        for edge in edges[info.v] {
            let newWeight = info.w + edge.w
            if newWeight < weights[edge.v] {
                weights[edge.v] = newWeight
                heap.enheap((edge.v, newWeight))
            }
        }
    }
    result[i-1] += weights[i]
}

print(result.max()!)
