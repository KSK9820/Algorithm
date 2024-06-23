let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let mx = [-1,1,0,0]
let my = [0,0,-1,1]
var stack = [(y: Int, x: Int)]()
var result = [Int]()
for y in 0..<n {
    for x in 0..<m {
        if arr[y][x] == 1 && !visited[y][x] {
            stack.append((y,x))
            var area = 0
            while true {
                guard let now = stack.popLast() else {
                    result.append(area)
                    break
                }
                if !visited[now.y][now.x] {
                    visited[now.y][now.x] = true
                    area += 1
                }
                
                for i in 0..<4 {
                    let newy = now.y + my[i]
                    let newx = now.x + mx[i]
                    
                    if newy < 0 || newy >= n || newx < 0 || newx >= m { continue }
                    if arr[newy][newx] != 1 || visited[newy][newx] { continue }
                    stack.append((newy, newx))
                }
            }
        }
    }
}
print(result.count)
print(result.count == 0 ? 0 : result.max()!)
