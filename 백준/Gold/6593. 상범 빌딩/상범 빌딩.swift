import Foundation
while true {
    let lrc = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r, c) = (lrc[0], lrc[1], lrc[2])
    if (l, r, c) == (0, 0, 0) { break }
    
    var building = Array(repeating: Array(repeating: Array(repeating: "", count: c), count: r), count: l)
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: l)
    var q = Queue<(z: Int, y: Int, x: Int, count: Int)>()
    
    for i in 0..<l {
        for j in 0...r {
            let input = readLine()!.map { String($0) }
            if input == [] { continue }
            if input.contains("S") {
                q.enqueue((i, j, input.firstIndex(of: "S")!, 1))
            }
            building[i][j] = input
        }
    }
    
    let dx = [1, 0, -1, 0]
    let dy = [0, -1, 0, 1]
    let dz = [1, -1]
    
    var flag = true
    while flag {
        guard let bum = q.dequeue() else { print("Trapped!");break }
        if visited[bum.z][bum.y][bum.x] == true { continue }
        visited[bum.z][bum.y][bum.x] = true

        
        for i in 0...1 {
            let newz = bum.z + dz[i]
            if newz >= 0 && newz < l {
                if visited[newz][bum.y][bum.x] == false {
                    if building[newz][bum.y][bum.x] == "E" {
                        print("Escaped in \(bum.count) minute(s).")
                        flag = false
                        break
                    }

                    if building[newz][bum.y][bum.x] == "." {
                        q.enqueue((z: newz, y: bum.y, x: bum.x, count: bum.count + 1))
                    }
                }
            }
        }
        
        
        for i in 0..<4 {
            let newy = bum.y + dy[i]
            let newx = bum.x + dx[i]
            
            if newy < 0 || newy >= r || newx < 0 || newx >= c { continue }
            if visited[bum.z][newy][newx] == false {
                if building[bum.z][newy][newx] == "E" {
                    print("Escaped in \(bum.count) minute(s).")
                    flag = false
                    break
                }
                if building[bum.z][newy][newx] == "." {
                    q.enqueue((z: bum.z, y: newy, x: newx, count: bum.count + 1))
                }
            }
        }
    }
    
}

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input
            input = [T]()
        }
        return output.popLast()
    }
}



