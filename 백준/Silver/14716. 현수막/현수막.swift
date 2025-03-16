let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let my = [-1,0,1,1,1,0,-1,-1]
let mx = [-1,-1,-1,0,1,1,1,0]

var result = 0
var stack = [(y: Int, x: Int)]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for y in 0..<n {
    for x in 0..<m {
        if visited[y][x] { continue }
        if arr[y][x] == 0 { continue }
        
        visited[y][x] = true
        stack.append((y,x))
        result += 1
        
        while true {
            guard let now = stack.popLast() else { break }
            
            for i in 0..<8 {
                let newy = now.y + my[i]
                let newx = now.x + mx[i]
                
                if newy < 0 || newx < 0 || newy >= n || newx >= m { continue }
                if arr[newy][newx] == 0 { continue }
                if visited[newy][newx] { continue }
                
                visited[newy][newx] = true
                stack.append((newy, newx))
            }
        }
    }
}
print(result)
