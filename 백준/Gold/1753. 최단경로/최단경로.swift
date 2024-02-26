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
            if index == target { break }
            
            array.swapAt(target, index)
            index = target
        }
        return value
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
}


let ve = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e) = (ve[0], ve[1])
let k = Int(readLine()!)!

var weights = [Int](repeating: Int.max, count: v+1)
var edges = [[(v: Int, w: Int)]](repeating: [], count: v+1)
var heap = Heap<(v: Int, w: Int)>{ $0.w > $1.w }
for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").map { Int($0)! }
    let (u,v,w) = (uvw[0], uvw[1], uvw[2])
    
    edges[u].append((v,w))
}

heap.enheap((k, 0))
weights[k] = 0

while !heap.isEmpty {
    let info = heap.deheap()!
    if info.w > weights[info.v] { continue }
    
    for edge in edges[info.v] {
        let newWeight = edge.w + info.w
        if weights[edge.v] > newWeight {
            weights[edge.v] = newWeight
            heap.enheap((edge.v, newWeight))
        }
    }
}
var result = ""
for i in 1...v {
    result += weights[i] == Int.max ? "INF" : String(weights[i])
    result += "\n"
}
print(result)