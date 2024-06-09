
let mnk = readLine()!.split(separator: " ").map { Int($0)! }
let (m,n,k) = (mnk[0], mnk[1], mnk[2])
var arr = Array(repeating: Array(repeating: 0, count: n), count: m)

for _ in 0..<k {
    let xyxy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1,y1) = (xyxy[0], m-xyxy[1])
    let (x2,y2) = (xyxy[2], m-xyxy[3])
    
    for x in x1..<x2 {
        for y in y2..<y1 {
            arr[y][x] = 1
        }
    }
}

//dfs
let mx = [0,0,-1,1]
let my = [1,-1,0,0]
var result = [Int]()

for y in 0..<m {
    for x in 0..<n {
        
        if arr[y][x] == 0 {
            var stack = [(y: Int, x: Int)]()
            stack.append((y,x))
            result.append(1)
            arr[y][x] = 1
            while true {
                guard let now = stack.popLast() else {
                    break
                }

                for i in 0..<4 {
                    let newx = now.x + mx[i]
                    let newy = now.y + my[i]
                    
                    if newx < 0 || newx >= n || newy < 0 || newy >= m { continue }
                    if arr[newy][newx] != 0 { continue }
                    
                    result[result.count - 1] += 1
                    arr[newy][newx] = result.last!
                    
                    stack.append((newy, newx))
                }
            }
        }
    }
}

print(result.count)
print(result.sorted(by: <).map { String($0) }.joined(separator: " "))