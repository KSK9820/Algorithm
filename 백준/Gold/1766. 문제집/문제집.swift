struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
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
    
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var degree = [Int](repeating: 0, count: n+1)
var graph = [[Int]](repeating: [], count: n+1)



for i in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[ab[0]].append(ab[1])
    degree[ab[1]] += 1
}

var h = Heap<Int>(compare: >)
for i in 1...n {
    if degree[i] == 0 {
        h.enheap(i)
    }
}

var result = ""
while true {
    guard let now = h.deheap() else { break }
    
    for i in graph[now] {
        degree[i] -= 1
        if degree[i] == 0 {
            h.enheap(i)
        }
    }
    
    result += "\(now) "
}
print(result)