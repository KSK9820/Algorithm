
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var room = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

let robot = readLine()!.split(separator: " ").map { Int($0)! }

// 0: 북쪽, 1: 동쪽, 2: 남쪽, 3: 서쪽
let mx = [0, 1, 0, -1]
let my = [-1, 0, 1, 0]

let rearx = [0, -1, 0, 1]
let reary = [1, 0, -1, 0]
let frontx = [0, 1, 0, -1]
let fronty = [-1, 0, 1, 0]
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    room[i] = input
}

// 청소한 상태: -1
var stack = [(y: Int, x: Int, d: Int)]()
stack.append((robot[0], robot[1], robot[2]))
var result = 0
while !stack.isEmpty {
    let now = stack.removeLast()
    if room[now.y][now.x] == 0 {
        room[now.y][now.x] = -1
        result += 1
    }

    var clean = true
    
    for i in 0..<4 {
        let newx = now.x + mx[i]
        let newy = now.y + my[i]
        
        if newx < 0 || newx >= m || newy < 0 || newy >= n { continue }
        if room[newy][newx] == 0 {
            clean = false
        }
    }
    
    if clean {
        let newy = now.y + reary[now.d]
        let newx = now.x + rearx[now.d]
        if newx < 0 || newx >= m || newy < 0 || newy >= n { break }

        if room[newy][newx] == 1 {
            break
        } else {
            stack.append((newy, newx, now.d))
        }
    }
    else {
        let newd = (now.d + 3) % 4
        let newy = now.y + fronty[newd]
        let newx = now.x + frontx[newd]
        if room[newy][newx] == 0 {
            stack.append((newy, newx, newd))
        } else {
            stack.append((now.y, now.x, newd))
        }
    }
}

print(result)
