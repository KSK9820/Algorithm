
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

let ne = readLine()!.split(separator: " ").map { Int($0)! }
let (n, e) = (ne[0], ne[1])
var edges = [[(d: Int, w: Int)]](repeating: [], count: n+1)
var heap = Heap<(d: Int, w: Int)> { $0.w > $1.w }

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    edges[abc[0]].append((abc[1], abc[2]))
    edges[abc[1]].append((abc[0], abc[2]))
}

let v = readLine()!.split(separator: " ").map { Int($0)! }
let (v1, v2) = (v[0], v[1])

func getDistance(way: [Int]) -> Int {
    var result = 0
    var weights = [Int](repeating: Int.max, count: n+1)
    
    for i in 0...2 {
        heap.makeEmpty()
        weights = [Int](repeating: Int.max, count: n+1)
        
        heap.enheap((way[i], 0))
        weights[way[i]] = 0
        
        while true {
            guard let info = heap.deheap() else {
                return Int.max
            }
            if info.w > weights[info.d] { continue }
            if info.d == way[i+1] {
                result += info.w
                break
            }
            
            for edge in edges[info.d] {
                let newWeight = edge.w + info.w
                if newWeight < weights[edge.d] {
                    weights[edge.d] = newWeight
                    heap.enheap((edge.d, newWeight))
                }
            }
        }
    }
   
    return result
}

var result1 = getDistance(way: [1,v1,v2,n])
var result2 = getDistance(way: [1,v2,v1,n])
if result1 == Int.max || result2 == Int.max {
    print(-1)
} else {
    print(min(result1, result2))
}
