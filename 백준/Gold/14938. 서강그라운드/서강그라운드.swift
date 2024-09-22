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

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
// 지역, 수색범위, 길의 개수
let (n,m,r) = (nmr[0], nmr[1], nmr[2])
var t = readLine()!.split(separator: " ").map { Int($0)! }
var edges = [[(d: Int, w: Int)]](repeating: [], count: n+1)
for _ in 0..<r {
    let abl = readLine()!.split(separator: " ").map { Int($0)! }
    edges[abl[0]].append((abl[1], abl[2]))
    edges[abl[1]].append((abl[0], abl[2]))
}

var result = 0
for i in 1...n {
    var weights = Array(repeating: Int.max, count: n+1)
    var h = Heap<(d: Int, w: Int)> { $0.w > $1.w }
    
    h.enheap((i,0))
    weights[i] = 0
    
    while true {
        guard let now = h.deheap() else { break }
        if now.w > weights[now.d] { continue }
        
        for edge in edges[now.d] {
            let newW = now.w + edge.w
            if newW > m { continue }
            if newW < weights[edge.d] {
                weights[edge.d] = newW
                h.enheap((edge.d, newW))
            }
        }
        
    }
    
    let w = weights.enumerated().filter { $0.element != Int.max }
    result = max(result, w.map { t[$0.offset-1] }.reduce(0, +))
    
}

print(result)