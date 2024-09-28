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

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m,n) = (mn[0], mn[1])
var miro = Array(repeating: [Int](), count: n)
for i in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    miro[i] = input
}

var h = Heap<(y: Int, x: Int, c: Int)> { $0.c > $1.c }
var weight = Array(repeating: Array(repeating: Int.max, count: m), count: n)

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

h.enheap((0,0,0))
weight[0][0] = 0

while true {
    guard let now = h.deheap() else { break }
    if weight[now.y][now.x] < now.c { continue }
    if now.y == n-1 && now.x == m-1 { break }
    
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newy >= n || newx < 0 || newx >= m { continue }
        if miro[newy][newx] == 0 {
            if now.c < weight[newy][newx] {
                weight[newy][newx] = now.c
                h.enheap((newy, newx, now.c))
            }
        } else {
            if now.c + 1 < weight[newy][newx] {
                weight[newy][newx] = now.c + 1
                h.enheap((newy, newx, now.c + 1))
            }
        }

    }
}
print(weight[n-1][m-1])