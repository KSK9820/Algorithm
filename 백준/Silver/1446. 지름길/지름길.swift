struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty {
            return nil
        }
        if array.count == 1 {
            return array.removeLast()
        }
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && compare(array[target], array[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[target], array[rightChildIndex]) {
                target = rightChildIndex
            }
            if target == index {
                break
            }
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}


let nd = readLine()!.split(separator: " ").map { Int($0)! }
let (n,d) = (nd[0], nd[1])
var edges = [[(d: Int, w: Int)]](repeating: [], count: d+1)
var weights = Array(repeating: Int.max, count: d+1)

for i in 0..<d {
    edges[i].append((i+1, 1))
}
for i in 0..<n {
    let sdw = readLine()!.split(separator: " ").map { Int($0)! }
    if sdw[0] > d || sdw[1] > d { continue }
    
    edges[sdw[0]].append((sdw[1], sdw[2]))
}

var h = Heap<(d: Int, w: Int)> { $0.w > $1.w }
h.enheap((0,0))
weights[0] = 0
while true {
    guard let now = h.deheap() else { break }
    
    if now.w > weights[now.d] { continue }
    if now.d == d { break }
    
    for edge in edges[now.d] {
        let newWeight = edge.w + now.w
        
        if newWeight < weights[edge.d] {
            weights[edge.d] = newWeight
            h.enheap((edge.d, newWeight))
        }
    }
}

print(weights[d])
