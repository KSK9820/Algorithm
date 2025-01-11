struct Heap<T> {
    var arr = [T]()
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
}

let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { Int(String($0))! }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]


var h = Heap<(y: Int, x: Int, b: Int)> { $0.b > $1.b }
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
h.enheap((0,0,0))
visited[0][0] = true


var result = Int.max
while true {
    guard let now = h.deheap() else { break }
    
    if now.y == n-1 && now.x == n-1 {
        result = min(result, now.b)
        continue
    }
    
    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newy >= n || newx < 0 || newx >= n { continue }
        if visited[newy][newx] { continue }
        visited[newy][newx] = true
        if arr[newy][newx] == 0 {
            h.enheap((newy, newx, now.b+1))
        } else {
            h.enheap((newy, newx, now.b))
        }
    }
}
print(result == Int.max ? 0 : result)