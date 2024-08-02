var result = ""
let mx = [0,0,-1,1,1,1,-1,-1]
let my = [1,-1,0,0,-1,1,-1,1]

while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let (w,h) = (wh[0], wh[1])
    if w == 0 && h == 0 { break }
    
    var map = Array(repeating: Array(repeating: 0, count: w), count: h)
    for i in 0..<h {
        map[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var stack = [(y: Int, x: Int)]()
    var count = 0
    
    for y in 0..<h {
        for x in 0..<w {
            if !visited[y][x] && map[y][x] == 1 {
                stack.append((y,x))
                visited[y][x] = true
                count += 1
                
                while true {
                    guard let now = stack.popLast() else { break }
                    
                    for i in 0..<8 {
                        let newy = now.y + my[i]
                        let newx = now.x + mx[i]
                        
                        if newy < 0 || newy >= h || newx < 0 || newx >= w { continue }
                        if map[newy][newx] == 0 { continue }
                        if visited[newy][newx] { continue }
                        visited[newy][newx] = true
                        stack.append((newy, newx))
                    }
                }
            }
        }
    }
    result += "\(count)\n"
}
print(result)