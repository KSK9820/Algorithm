let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var melt = [Int]()
var count = 0

var cheeze = Array(repeating: Array(repeating:0, count: m), count: n)
for i in 0..<n {
    cheeze[i] = readLine()!.split(separator: " ").map { Int($0)! }
    count += cheeze[i].filter { $0 == 1 }.count
}
melt.append(count)

let mx = [0, 1, 0, -1]
let my = [1, 0, -1, 0]


var q = Queue<(y: Int, x: Int)>()
var temp = Queue<(y: Int, x: Int)>()
q.enqueue((0,0))


while true {
    var melted = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    while true {
        guard let now = q.dequeue() else { break }
        
        for i in 0..<4 {
            let newy = now.y + my[i]
            let newx = now.x + mx[i]
            
            if newy < 0 || newx < 0 || newy >= n || newx >= m { continue }
            
            if cheeze[newy][newx] == 1 {
                cheeze[newy][newx] = 0
                melted += 1
                visited[newy][newx] = true
                temp.enqueue((newy, newx))
            } else if cheeze[newy][newx] == 0 && !visited[newy][newx] {
                visited[newy][newx] = true
                q.enqueue((newy, newx))
            }
        }
    }
    melt.append(count-melted)
    count -= melted
    
    if count == 0 { break }
    q = temp
}
print(melt.count - 1)
print(melt[melt.count - 2])

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
    
    var isEmpty: Bool {
        output.isEmpty && input.isEmpty
    }
}
