
struct Heap<T> {
    var arr = [T]()
    let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex-1)/2
        
        while childIndex > 0 && compare(arr[parentIndex], arr[childIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex-1)/2
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
            
            while leftChildIndex < arr.count && compare(arr[target], arr[leftChildIndex]) {
                target = leftChildIndex
            }
            
            while rightChildIndex < arr.count && compare(arr[target], arr[rightChildIndex]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
    
    mutating func makeEmpty() {
        arr = []
    }
    
    var root: T? {
        arr.first
    }
    
    var isEmpty: Bool {
        arr.isEmpty
    }
}

let nve = readLine()!.split(separator: " ").map { Int($0)! }
let (n,v,e) = (nve[0], nve[1], nve[2])

let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b) = (ab[0], ab[1])

let h = readLine()!.split(separator: " ").map { Int($0)! }

var edges = [[(d: Int, w: Int)]](repeating: [], count: v+1)
for _ in 0..<e {
    let abl = readLine()!.split(separator: " ").map { Int($0)! }
    edges[abl[0]].append((abl[1], abl[2]))
    edges[abl[1]].append((abl[0], abl[2]))
}

var result = 0

var heap = Heap<(d: Int, w: Int)> { $0.w > $1.w }
for i in 0..<h.count {
    heap.enheap((h[i],0))
    var weights = [Int](repeating: Int.max, count: v+1)
    weights[h[i]] = 0
    
    while true {
        guard let now = heap.deheap() else { break }
        
        if now.w > weights[now.d] { continue }
        if now.d == a { break }
        
        for edge in edges[now.d] {
            let newWeight = edge.w + now.w
            if newWeight < weights[edge.d] {
                weights[edge.d] = newWeight
                heap.enheap((edge.d, newWeight))
            }
        }
    }
    heap.makeEmpty()
    result +=  weights[a] == Int.max ? -1 : weights[a]
}

for i in 0..<h.count {
    heap.enheap((h[i],0))
    var weights = [Int](repeating: Int.max, count: v+1)
    weights[h[i]] = 0
    
    while true {
        guard let now = heap.deheap() else { break }
        
        if now.w > weights[now.d] { continue }
        if now.d == b { break }
        
        for edge in edges[now.d] {
            let newWeight = edge.w + now.w
            if newWeight < weights[edge.d] {
                weights[edge.d] = newWeight
                heap.enheap((edge.d, newWeight))
            }
        }
    }
    heap.makeEmpty()
    result +=  weights[b] == Int.max ? -1 : weights[b]
}
print(result)
