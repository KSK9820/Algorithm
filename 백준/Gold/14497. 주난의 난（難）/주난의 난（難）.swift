
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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

let xy = readLine()!.split(separator: " ").map { Int($0)! - 1 }

var criminal = (y: xy[2], x: xy[3])
var array = Array(repeating: Array(repeating: "", count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n {
    array[i] = readLine()!.map { String($0) }
}
 
var h = Heap<(y: Int, x: Int, c: Int)> {
    $0.c > $1.c
}
h.enheap((xy[0], xy[1], 0))
visited[xy[0]][xy[1]] = true

while true {
    guard let now = h.deheap() else { break }
    if now.y == criminal.y && now.x == criminal.x {
        print(now.c)
        break
    }
    
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newx < 0 || newx >= m || newy >= n { continue }
        if visited[newy][newx] { continue }
        visited[newy][newx] = true
        
        if array[newy][newx] == "0" {
            h.enheap((newy, newx, now.c))
        } else {
            h.enheap((newy, newx, now.c + 1))
            array[newy][newx] = "0"
        }
    }
}
