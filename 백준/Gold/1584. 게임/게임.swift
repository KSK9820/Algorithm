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

var arr = Array(repeating: Array(repeating: 0, count: 501), count: 501)
let n = Int(readLine()!)!
for _ in 0..<n {
    let xyxy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1,y1,x2,y2) = (xyxy[0], xyxy[1], xyxy[2], xyxy[3])
    
    for y in min(y1,y2)...max(y1,y2) {
        for x in min(x1,x2)...max(x1,x2) {
            arr[y][x] = 1
        }
    }
}
let m = Int(readLine()!)!
for _ in 0..<m {
    let xyxy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1,y1,x2,y2) = (xyxy[0], xyxy[1], xyxy[2], xyxy[3])
    
    for y in min(y1,y2)...max(y1,y2) {
        for x in min(x1,x2)...max(x1,x2) {
            arr[y][x] = -1
        }
    }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

var h = Heap<(y: Int, x: Int, w: Int)> { $0.w > $1.w }
var weight = Array(repeating: Array(repeating: Int.max, count: 501), count: 501)

h.enheap((0,0,0))
weight[0][0] = 0

while true {
    guard let now = h.deheap() else { print(-1); break }
    if now.w > weight[now.y][now.x] { continue }
    if now.y == 500 && now.x == 500 { print(now.w); break }

    for i in 0..<4 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newx < 0 || newy >= 501 || newx >= 501 { continue }
        if arr[newy][newx] == -1 { continue }
        
        if arr[newy][newx] == 0 {
            if weight[newy][newx] > now.w {
                h.enheap((newy, newx, now.w))
                weight[newy][newx] = now.w
            }
        } else {
            if weight[newy][newx] > now.w + 1 {
                h.enheap((newy, newx, now.w + 1))
                weight[newy][newx] = now.w + 1
            }
        }
    }
}
