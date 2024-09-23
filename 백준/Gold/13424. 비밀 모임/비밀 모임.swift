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

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m) = (nm[0], nm[1])
    
    var edges: [[(d: Int, w: Int)]] = Array(repeating: [], count: n+1)
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map { Int($0)! }
        edges[abc[0]].append((abc[1], abc[2]))
        edges[abc[1]].append((abc[0], abc[2]))
    }
    
    let k = Int(readLine()!)!
    let karr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var result = Array(repeating: 0, count: n+1)
    for i in 0..<k {
        var weight = Array(repeating: Int.max, count: n+1)
        var h = Heap<(d: Int, w: Int)> { $0.w > $1.w }
        
        h.enheap((karr[i],0))
        weight[karr[i]] = 0
        
        while true {
            guard let now = h.deheap() else { break }
            if now.w > weight[now.d] { continue }
            
            for edge in edges[now.d] {
                let newWeight = edge.w + now.w
                if newWeight < weight[edge.d] {
                    weight[edge.d] = newWeight
                    h.enheap((edge.d, newWeight))
                }
            }
        }
        
        for i in weight.indices {
            if weight[i] == Int.max { continue }
            result[i] += weight[i]
        }
    }
    result.removeFirst()
    let value = result.min()!
    print(result.firstIndex(of: value)!+1)
}