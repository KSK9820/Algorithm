struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        
        return output.popLast()
    }
    
    var count: Int {
        input.count + output.count
    }
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}

struct Coord: Hashable {
    let y: Int
    let x: Int
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var q = Queue<(c: Coord, r: Int)>()
let xy = readLine()!.split(separator: " ").map { Int($0)! }
q.enqueue((Coord(y: xy[0]-1, x: xy[1]-1), 0))

var enemy = [Coord]()
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    enemy.append(Coord(y: ab[0]-1, x: ab[1]-1))
}

let mx = [-1,1,-2,2,-2,2,-1,1]
let my = [-2,-2,-1,-1,1,1,2,2]

var result = Array(repeating: Array(repeating: Int.max, count: n), count: n)
result[xy[0]-1][xy[1]-1] = 0

while true {
    guard let now = q.dequeue() else { break }
    
    for i in 0..<8 {
        let newy = now.c.y + my[i]
        let newx = now.c.x + mx[i]
        
        if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
        
        if result[newy][newx] > now.r+1 {
            result[newy][newx] = now.r+1
            q.enqueue((Coord(y: newy, x: newx), now.r + 1))
        }
    }
}

var answer = ""
for e in enemy {
    answer += "\(result[e.y][e.x]) "
}
print(answer)
