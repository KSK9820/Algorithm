
struct Heap<T> {
    private var arr = [T]()
    let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), comapre: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = comapre
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
    
    var root: T? {
        if arr.count == 0 {
            return nil
        }
        
        return arr[0]
    }
    
    var count: Int {
        arr.count
    }
}

let n = Int(readLine()!)!
var h = Heap<Int>(comapre: >)
var l = [(s: Int, e: Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    l.append((input[1], input[2]))
}

l = l.sorted { $0.e < $1.e }.sorted { $0.s < $1.s }

h.enheap(l[0].e)

for i in 1..<n {
    guard let root = h.root else { break }
    
    if l[i].s >= root {
        _ = h.deheap()
    }
    
    h.enheap(l[i].e)
}

print(h.count)