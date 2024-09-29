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



let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]


// 섬 이름 짓기
var s = [(y: Int, x: Int)]()
var idx = -1
for y in 0..<n {
    for x in 0..<n {
        if map[y][x] == 1 {
            s.append((y,x))
            map[y][x] = idx
            while true {
                guard let now = s.popLast() else { idx -= 1; break }
                
                for i in 0..<4 {
                    let newy = now.y + my[i]
                    let newx = now.x + mx[i]
                    
                    if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
                    if map[newy][newx] == idx || map[newy][newx] == 0 { continue }
                    map[newy][newx] = idx
                    s.append((newy, newx))
                }
            }
            
        }
    }
}


var result = Int.max
for y in 0..<n {
    for x in 0..<n {
        if map[y][x] != 0 {
            var q = Queue<(y: Int, x: Int, c: Int)>()
            q.enqueue((y,x,0))
            
            let start = map[y][x]
            let startxy = (y,x)
            var visited = Array(repeating: Array(repeating: false, count: n), count: n)
            visited[y][x] = true
            
            while true {
                guard let now = q.dequeue() else { break }
                if map[now.y][now.x] != 0 && map[now.y][now.x] != start {
                    result = min(result, now.c-1)
                    break
                }
                
                for i in 0..<4 {
                    let newy = now.y + my[i]
                    let newx = now.x + mx[i]
                    
                    if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
                    if visited[newy][newx] { continue }
                    if map[newy][newx] != start {
                        q.enqueue((newy, newx, now.c+1))
                        visited[newy][newx] = true
                    }
                }
                
            }
        }
    }
}

print(result)
