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

}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var order = Heap<(idx: Int, order: Int)> {
    if $0.order == $1.order {
        return $0.idx > $1.idx
    }
    return $0.order > $1.order
}

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 1...input[0] {
        order.enheap((i, input[j]))
    }
}
let make = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = Array(repeating: 0, count: n)
var index = 0
while true {
    if m == index { break }
    
    guard let o = order.deheap() else { break }
    if o.order == make[index] {
        result[o.idx] += 1
        index += 1
    } else if o.order > make[index] {
        index += 1
        order.enheap(o)
    }
}

print(result.map { String($0) }.joined(separator: " "))