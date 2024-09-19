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

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var h = Heap<(v: Int, c: Int)> {
    if $0.c == $1.c { return $0.v < $1.v }
    return $0.c > $1.c
}
for _ in 0..<k {
    let vc = readLine()!.split(separator: " ").map { Int($0)! }
    h.enheap((vc[0], vc[1]))
}

var v = 0
var c = 0
var result = Heap<(v: Int, c: Int)> {
    if $0.v == $1.v { return $0.c < $1.c }
    return $0.v > $1.v
}

while true {
    if v >= m && result.count == n { break }
    guard let sul = h.deheap() else { break }
    
    if result.count < n {
        v += sul.v
        result.enheap(sul)
    } else if v < m && result.count >= n {
        let temp = result.deheap()!
        v -= temp.v
        v += sul.v
        result.enheap(sul)
    }
    c = max(c, sul.c)
}

if v < m {
    print("-1")
} else {
    print(c)
}

