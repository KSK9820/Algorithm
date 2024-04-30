
struct heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T,T) -> Bool) {
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
    var count: Int {
        arr.count
    }
}


let n = Int(readLine()!)!
var h = heap<(s: Int, e: Int, c: Int)> { $0.s > $1.s }
var result = heap<(s: Int, e: Int, c: Int)> { $0.s > $1.s }
for _ in 0..<n {
    let sec = readLine()!.split(separator: " ").map { Int($0)! }
    let (s,e,c) = (sec[0],sec[1],sec[2])
    
    h.enheap((s,e,c))
}

while true {
    guard let now = h.deheap() else { break }
    guard let second = h.deheap() else { result.enheap(now); break }
    
    if now.e < second.s {
        result.enheap(now)
        h.enheap(second)
    } else {
        h.enheap((now.s, max(now.e, second.e), min(now.c, second.c)))
    }
}

print(result.count)
while true {
    guard let now = result.deheap() else { break }
    print("\(now.s) \(now.e) \(now.c)")
}