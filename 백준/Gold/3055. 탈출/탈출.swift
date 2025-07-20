
import Foundation


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
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}



typealias coord = (y: Int, x: Int)

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c) = (rc[0], rc[1])

var f = Array(repeating: Array(repeating: "", count: c), count: r)
var go = coord(y: 0, x: 0)
var beaver = coord(y: 0, x: 0)
var water = Queue<coord>()

for i in 0..<r {
    f[i] = Array(readLine()!).map { String($0) }
    
    for j in f[i].indices {
        if f[i][j] == "D" {
            beaver = (i, j)
        }
        if f[i][j] == "S" {
            go = (i, j)
        }
        if f[i][j] == "*" {
            water.enqueue((i,j))
        }
    }
}

var result = "KAKTUS"
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
var q = Queue<(loc: coord, count: Int)>()
q.enqueue((go, 0))
visited[go.y][go.x] = true
f[go.y][go.x] = "."

let my = [0,0,-1,1]
let mx = [1,-1,0,0]

outer: while !q.isEmpty {
    // 물
    let waterCount = water.count
    for _ in 0..<waterCount {
        guard let now = water.dequeue() else { break }
        
        for i in 0..<4 {
            let newy = now.y + my[i]
            let newx = now.x + mx[i]
        
            if newy < 0 || newy >= r || newx < 0 || newx >= c { continue }
            
            if f[newy][newx] == "." {
                f[newy][newx] = "*"
                water.enqueue((newy, newx))
            }
        }
    }
    
    // 고슴
    let goCount = q.count
    for _ in 0..<goCount {
        guard let now = q.dequeue() else { break outer }
        
        for i in 0..<4 {
            let newy = now.loc.y + my[i]
            let newx = now.loc.x + mx[i]
            
            if newy < 0 || newy >= r || newx < 0 || newx >= c { continue }
            if f[newy][newx] == "*" || f[newy][newx] == "X" { continue }
            if visited[newy][newx] { continue }
            
            visited[newy][newx] = true
            if f[newy][newx] == "D" {
                result = "\(now.count + 1)"
                break outer
            }
            q.enqueue(((newy, newx), now.count + 1))
        }
    }
}

print(result)