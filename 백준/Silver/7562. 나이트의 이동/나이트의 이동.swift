struct Heap<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enheap(_ new: T) {
        input.append(new)
    }
    
    mutating func deheap() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
    
    mutating func makeEmpty() {
        input = [T]()
        output = [T]()
    }
}

var result = ""
let mx = [-2, -1, 1, 2, 2, 1, -1, -2]
let my = [-1, -2, -2, -1, 1, 2, 2, 1]

for _ in 0..<Int(readLine()!)! {
    let l = Int(readLine()!)!
    let now = readLine()!.split(separator: " ").map { Int($0)! }
    let des = readLine()!.split(separator: " ").map { Int($0)! }
    
    var heap = Heap<(y: Int, x: Int, c: Int)>()
    heap.enheap((now[0], now[1], 0))
    var visited = Array(repeating: Array(repeating: false, count: l), count: l)
    
    while true {
        guard let now = heap.deheap() else { break }
        if now.y == des[0] && now.x == des[1] {
            result += "\(now.c)\n"
            heap.makeEmpty()
            break
        }
        
        for i in 0..<8 {
            let newx = now.x + mx[i]
            let newy = now.y + my[i]
            
            if newx < 0 || newx >= l || newy < 0 || newy >= l { continue }
            if visited[newy][newx] { continue }
            
            visited[newy][newx] = true
            heap.enheap((newy, newx, now.c + 1))
        }
    }
}
        
result.removeLast()
print(result)
