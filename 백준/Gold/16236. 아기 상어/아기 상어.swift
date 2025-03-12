struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    mutating func enqueue(_ new: T) {
        input.append(new)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
    
    var count: Int {
        input.count + output.count
    }
}

let n = Int(readLine()!)!
var sea = Array(repeating: Array(repeating: 0, count: n), count: n)
var shark: (y: Int, x: Int) = (-1,-1)
var size = 2
var eat = 0
var result = 0
for i in 0..<n {
    sea[i] = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<n {
        if sea[i][j] == 9 {
            shark = (i,j)
            sea[i][j] = 0
        }
    }
}

while true {
    guard let fish = findFish() else {
        print(result)
        break
    }
    
    result += fish.d
    shark = (fish.y, fish.x)
    eat += 1
    sea[fish.y][fish.x] = 0
    
    if eat == size {
        size += 1
        eat = 0
    }
}

func findFish() -> (y: Int, x: Int, d: Int)? {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var q = Queue<(y: Int, x: Int, c: Int)>()
    var distance = 0
    
    let mx = [0,0,-1,1]
    let my = [1,-1,0,0]
    
    var fish = [(y: Int, x: Int)]()
    
    q.enqueue((shark.y, shark.x, 0))
    
    while true {
        guard let now = q.dequeue() else { break }
        
        for i in 0..<4 {
            let newy = now.y + my[i]
            let newx = now.x + mx[i]
            
            if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
            if visited[newy][newx] { continue }
            if sea[newy][newx] <= size {
                visited[newy][newx] = true
                q.enqueue((newy, newx, now.c + 1))
                
                if fish.count == 0 && sea[newy][newx] < size && sea[newy][newx] != 0 {
                    distance = now.c + 1
                }
                if distance == now.c + 1 && sea[newy][newx] < size && sea[newy][newx] != 0 {
                    fish.append((newy, newx))
                }
            }
        }
    }
    
    if let last = fish.sorted(by: { $0.x < $1.x }).sorted(by: { $0.y < $1.y }).first {
        return (last.y, last.x, distance)
    }
    
    return nil
}
