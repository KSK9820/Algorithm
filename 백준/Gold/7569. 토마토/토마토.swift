let mnh = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n, h) = (mnh[0], mnh[1], mnh[2])
var tomato = [[[Int]]]()

var result = 0
var q = Queue<(z: Int, y: Int, x: Int, day: Int)>()

for z in 0..<h {
    var inside = [[Int]]()
    for j in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        inside.append(input)
        for i in 0..<m {
            if 1 == input[i] {
                inside[j][i] = 0
                q.enqueue((z, j, i, 0))
            }
        }
    }
    tomato.append(inside)
}

let dy = [0, 0, 0, 1, 0, -1]
let dx = [0, 0, 1, 0, -1, 0]
let dz = [1, -1, 0, 0, 0, 0]

while true {
    guard let ripe = q.dequeue() else { break }
    if tomato[ripe.z][ripe.y][ripe.x] != 0 { continue }
    tomato[ripe.z][ripe.y][ripe.x] = 1
    result = ripe.day
    for i in 0..<6 {
        let newY = ripe.y + dy[i]
        let newX = ripe.x + dx[i]
        let newZ = ripe.z + dz[i]
        if newY < 0 || newY >= n || newX < 0 || newX >= m || newZ < 0 || newZ >= h { continue }
        if tomato[newZ][newY][newX] == 0 {
            q.enqueue((newZ, newY, newX, ripe.day + 1))
        }
    }
}

for z in tomato {
    for t in z {
        if t.contains(0) {
            result = -1
            break
        }
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
