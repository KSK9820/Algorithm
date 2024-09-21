struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(arr[parentIndex], arr[childIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
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
    
    var count: Int {
        arr.count
    }

}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var edges = [[(d: Int, w: Int)]](repeating: [], count: n+1)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    edges[abc[0]].append((abc[1], abc[2]))
    edges[abc[1]].append((abc[0], abc[2]))
}
let st = readLine()!.split(separator: " ").map { Int($0)! }
let (s,t) = (st[0], st[1])

var heap = Heap<(d: Int, w: Int)>{ $0.w > $1.w }
var weights = [Int](repeating: Int.max, count: n+1)
heap.enheap((s,0))
weights[s] = 0
while true {
    guard let info = heap.deheap() else { break }
    if info.d == t { break }
    if info.w > weights[info.d] { continue }
    
    for edge in edges[info.d] {
        let newWeight = edge.w + info.w
        if newWeight < weights[edge.d] {
            weights[edge.d] = newWeight
            heap.enheap((edge.d, newWeight))
        }
    }
}
print(weights[t])