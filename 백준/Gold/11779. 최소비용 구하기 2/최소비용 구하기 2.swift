struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T,T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count-1
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
        arr.removeAll()
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var edge = [[(d: Int, w: Int)]](repeating: [], count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edge[input[0]].append((input[1], input[2]))
}
let city = readLine()!.split(separator: " ").map { Int($0)! }
let (cs, cd) = (city[0], city[1])

var weight = [Int](repeating: Int.max, count: n+1)
var heap = Heap<(d: Int, w: Int, r: [Int])>{ $0.w > $1.w }

heap.enheap((cs, 0, [cs]))
weight[cs] = 0

while true {
    guard let now = heap.deheap() else { break }
    if now.w > weight[now.d] { continue }
    if now.d == cd {
        print(now.w)
        print(now.r.count)
        print(now.r.map { String($0) }.joined(separator: " "))
        break
    }
    
    for e in edge[now.d] {
        let newWeight = now.w + e.w
        if newWeight < weight[e.d] {
            weight[e.d] = newWeight
            heap.enheap((e.d, newWeight, now.r + [e.d]))
        }
    }
}