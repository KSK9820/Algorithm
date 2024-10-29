let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var room = Array(repeating: Array(repeating: "", count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    room[i] = readLine()!.map { String($0) }
}

var stack = [(y: Int, x: Int)]()
let mx = [-1,1]
let my = [1,-1]
var result = 0
for y in 0..<n {
    for x in 0..<m {
        if visited[y][x] { continue }
        
        stack.append((y,x))
        visited[y][x] = true
        
        while true {
            guard let now = stack.popLast() else { result += 1; break }
            
            if room[now.y][now.x] == room[y][x] {
                for i in 0..<2 {
                    if room[y][x] == "-" {
                        let newx = now.x + mx[i]
                        if newx < 0 || newx >= m { continue }
                        if visited[now.y][newx] { continue }
                        if room[now.y][newx] != room[y][x] { continue }
                        
                        visited[now.y][newx] = true
                        stack.append((now.y, newx))
                    } else if room[y][x] == "|" {
                        let newy = now.y + my[i]
                        if newy < 0 || newy >= n { continue }
                        if visited[newy][now.x] { continue }
                        if room[newy][now.x] != room[y][x] { continue }
                        
                        visited[newy][now.x] = true
                        stack.append((newy, now.x))
                        
                    }
                }
            }
        }
    }
}
print(result)
