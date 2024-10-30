let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var farm = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    farm[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let mx = [0,0,1,-1,1,1,-1,-1]
let my = [1,-1,0,0,1,-1,1,-1]

var result = 0

for y in 0..<n {
    for x in 0..<m {
        if visited[y][x] { continue }
        
        var stack = [(y: y, x: x)]
        visited[y][x] = true
        
        var flag = true
        while true {
            guard let now = stack.popLast() else {
                if flag { result += 1 }
                break
            }
            
            for i in 0..<8 {
                let newy = now.y + my[i]
                let newx = now.x + mx[i]
                
                if newy < 0 || newx < 0 || newy >= n || newx >= m { continue }
                
                if farm[newy][newx] > farm[now.y][now.x] {
                    flag = false
                } else if !visited[newy][newx] && farm[newy][newx] == farm[now.y][now.x] {
                    stack.append((newy, newx))
                    visited[newy][newx] = true
                }
            }
        }
    }
}
print(result)