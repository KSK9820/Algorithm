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
    
    mutating func empty() {
        array.removeAll()
    }
}


let vep = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e, p) = (vep[0], vep[1], vep[2])

var weights = [Int](repeating: Int.max, count: v+1)
var edges = [[(d: Int, w: Int)]](repeating: [], count: v+1)
var heap = Heap<(d: Int, w: Int)> { $0.w > $1.w }

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    edges[abc[0]].append((abc[1], abc[2]))
    edges[abc[1]].append((abc[0], abc[2]))
}

func dik(start: Int, end: Int) -> Int {
    heap.enheap((start,0))
    weights[start] = 0
    while true {
        guard let info = heap.deheap() else { break }
        if info.w > weights[info.d] { continue }
        
        for edge in edges[info.d] {
            let newWeight = edge.w + info.w
            if newWeight < weights[edge.d] {
                weights[edge.d] = newWeight
                heap.enheap((edge.d, newWeight))
            }
        }
    }
    return weights[end]
}

let total = dik(start: 1, end: v)

heap.empty()
weights = [Int](repeating: Int.max, count: v+1)

let tominjun = dik(start: 1, end: p)
let minjuntoend = dik(start: p, end: v)
if total == tominjun + minjuntoend {
    print("SAVE HIM")
} else {
    print("GOOD BYE")
}