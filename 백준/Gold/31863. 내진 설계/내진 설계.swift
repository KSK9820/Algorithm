
struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var q = Queue<(y: Int, x: Int)>()
var visited = Array(repeating: Array(repeating: 1, count: m), count: n)
var arr = Array(repeating: Array(repeating: "", count: m), count: n)
var building = 0
for i in 0..<n {
    arr[i] = readLine()!.map { String($0) }
    for j in 0..<m {
        if arr[i][j] == "@" {
            q.enqueue((i,j))
            visited[i][j] = 0
        }
        if arr[i][j] == "*" || arr[i][j] == "#" { building += 1 }
    }
}

var wx = [-1,0,1,0]
var wy = [0,-1,0,1]
var result = 0


// 본진
let now = q.dequeue()!
for i in 0..<4 {
    var newy = now.y + wy[i]
    var newx = now.x + wx[i]
    
    if newy < 0 || newy >= n || newx < 0 || newx >= m { continue }
    if arr[newy][newx] == "|" { continue }
    
    if arr[newy][newx] == "#" {
        visited[newy][newx] -= 1
        if visited[newy][newx] == -1 {
            q.enqueue((newy, newx))
            result += 1
        }
    } else if arr[newy][newx] == "*" {
        visited[newy][newx] = -1
        result += 1
        q.enqueue((newy, newx))
    }
    
    newy = newy + wy[i]
    newx = newx + wx[i]
    if newy < 0 || newy >= n || newx < 0 || newx >= m { continue }
    if arr[newy][newx] == "|" { continue }
    
    if arr[newy][newx] == "#" {
        visited[newy][newx] -= 1
        if visited[newy][newx] == -1 { q.enqueue((newy, newx)); result += 1 }
        
    } else if arr[newy][newx] == "*" {
        visited[newy][newx] = -1
        result += 1
        q.enqueue((newy, newx))
    }
}

while true {
    guard let now = q.dequeue() else { break }
    for i in 0..<4 {
        let newy = now.y + wy[i]
        let newx = now.x + wx[i]
        
        if newy < 0 || newy >= n || newx < 0 || newx >= m { continue }
        if visited[newy][newx] == -1 { continue }
       
        if arr[newy][newx] == "#" {
            visited[newy][newx] -= 1
            if visited[newy][newx] == -1 {
                result += 1
                q.enqueue((newy, newx))
            }
        } else if arr[newy][newx] == "*" {
            visited[newy][newx] = -1
            result += 1
            q.enqueue((newy, newx))
        }
    }
}


print(result, building-result)
