let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
var tomato = [[Int]]()
var result = 0
var q = Queue<(y: Int, x: Int, day: Int)>()
for j in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    tomato.append(input)
    for i in 0..<m {
        if 1 == input[i] {
            tomato[j][i] = 0
            q.enqueue((j, i, 0))
        }
    }
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

while true {
    guard let ripe = q.dequeue() else { break }
    if tomato[ripe.y][ripe.x] != 0 { continue }
    tomato[ripe.y][ripe.x] = 1
    result = ripe.day
    for i in 0..<4 {
        let newY = ripe.y + dy[i]
        let newX = ripe.x + dx[i]
        
        if newY < 0 || newY >= n || newX < 0 || newX >= m { continue }
        if tomato[newY][newX] == 0 {
            q.enqueue((newY, newX, ripe.day + 1))
        }
    }
}

for t in tomato {
    if t.contains(0) {
        result = -1
        break
    }
}
print(result)

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
}
