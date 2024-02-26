
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
    
    var isEmpty: Bool {
        array.isEmpty
    }
}
var result = [Int]()
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    
    var heap = Heap<(vertex: (y: Int, x: Int), weight: Int)>() { $0.weight > $1.weight }
    var arr = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    var record = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    for i in 0..<n {
        let doduk = readLine()!.split(separator: " ").map { Int($0)! }
        arr[i] = doduk
    }
    
    heap.enheap((vertex: (0,0), weight: arr[0][0]))
    
    while !heap.isEmpty {
        let info = heap.deheap()!
        
        if info.vertex.x == n-1 && info.vertex.y == n-1 {
            break
        }
        
        if info.weight > record[info.vertex.y][info.vertex.x] {
            continue
        }
        
        for i in 0..<4 {
            let newx = info.vertex.x + dx[i]
            let newy = info.vertex.y + dy[i]
            
            if newx < 0 || newy < 0 || newx >= n || newy >= n { continue }
            
            let newWeight = info.weight + arr[newy][newx]
            if newWeight < record[newy][newx] {
                record[newy][newx] = newWeight
                heap.enheap(((newy, newx), newWeight))
            }
        }
    }
    result.append(record[n-1][n-1])
}

for i in 0..<result.count {
    print("Problem \(i+1): \(result[i])")
}
