let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c) = (rc[0], rc[1])

var madang = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
for i in 0..<r {
    madang[i] = readLine()!.map { String($0) }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

var stack = [(y: Int, x: Int)]()
var o = 0
var v = 0
for y in 0..<r {
    for x in 0..<c {
        
        var tempO = 0
        var tempV = 0
        
        if !visited[y][x] && madang[y][x] != "#" {
            stack.append((y, x))
            visited[y][x] = true
            switch madang[y][x] {
            case "v":
                tempV += 1
            case "o":
                tempO += 1
            default:
                break
            }
        }
 

        while true {
            guard let now = stack.popLast() else {
                if tempO > tempV {
                    o += tempO
                } else {
                    v += tempV
                }
                break
            }
            
            for i in 0..<4 {
                let newy = now.y + my[i]
                let newx = now.x + mx[i]
                
                if newy < 0 || newy >= r || newx < 0 || newx >= c { continue }
                
                if visited[newy][newx] { continue }
                if madang[newy][newx] == "#" { continue }
                visited[newy][newx] = true
                stack.append((newy, newx))
                
                switch madang[newy][newx] {
                case "v":
                    tempV += 1
                case "o":
                    tempO += 1
                default:
                    break
                }
                
            }
        }
    }
}

print("\(o) \(v)")