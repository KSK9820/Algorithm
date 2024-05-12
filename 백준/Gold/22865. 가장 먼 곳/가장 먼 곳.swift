struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        arr.append(newElement)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(arr[parentIndex], arr[childIndex]) {
            arr.swapAt(parentIndex, childIndex)
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
}

let n = Int(readLine()!)!
let abc = readLine()!.split(separator: " ").map { Int($0)! }

var edges = [[(d: Int, w: Int)]](repeating: [], count: n+1)
var weights = [[Int]]()

for _ in 0..<Int(readLine()!)! {
    let del = readLine()!.split(separator: " ").map { Int($0)! }
    edges[del[0]].append((del[1], del[2]))
    edges[del[1]].append((del[0], del[2]))
}

for i in abc {
    var weight = [Int](repeating: Int.max, count: n+1)
    var heap = Heap<(d: Int, w: Int)>{ $0.w > $1.w }
    
    heap.enheap((i, 0))
    weight[i] = 0
    
    while true {
        guard let now = heap.deheap() else { break }
        if now.w > weight[now.d] { continue }
        
        for edge in edges[now.d] {
            let newWeight = now.w + edge.w

            if newWeight < weight[edge.d] {
                weight[edge.d] = newWeight
                heap.enheap((edge.d, newWeight))
            }
        }
    }
    
    weights.append(weight)
}

var result = 0
var value = 0
for i in 1...n {
    let maximum = min(weights[0][i], weights[1][i], weights[2][i])
    if maximum > value {
        value = maximum
        result = i
    }
}
print(result)
