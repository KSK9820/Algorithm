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
    let ndc = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,d,c) = (ndc[0], ndc[1], ndc[2])
    
    var computer = Array(repeating: [(d: Int, w: Int)](), count: n+1)
    var h = Heap<(d: Int, w: Int)> { $0.w > $1.w }
    var weight = [Int](repeating: Int.max, count: n+1)
    for _ in 0..<d {
        let abs = readLine()!.split(separator: " ").map { Int($0)! }
        computer[abs[1]].append((abs[0], abs[2]))
    }
    
    h.enheap((c,0))
    weight[c] = 0
    
    while true {
        guard let now = h.deheap() else { break }
        
        for c in computer[now.d] {
            let newWeight = now.w + c.w
            if newWeight < weight[c.d] {
                weight[c.d] = newWeight
                h.enheap((c.d, newWeight))
            }
        }
    }
    
    let result = weight.filter { $0 != Int.max }
    print(result.count, result.max()!)
}