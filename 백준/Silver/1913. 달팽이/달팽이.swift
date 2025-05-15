var n = Int(readLine()!)!
let c = Int(readLine()!)!

var arr = Array(repeating: Array(repeating: 0, count: n), count: n)

var num = n * n
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

var dir = 0

var (x,y) = (0,0)
var result = ""
while num > 0 {
    if num == c {
        result = "\(y+1) \(x+1)"
    }
    arr[y][x] = num
    num -= 1
    
    let nx = x + dx[dir]
    let ny = y + dy[dir]
    
    if nx < 0 || nx >= n || ny < 0 || ny >= n || arr[ny][nx] != 0 {
        dir = (dir + 1) % 4
    }
    
    y += dy[dir]
    x += dx[dir]
}

for row in arr {
    print(row.map { String($0) }.joined(separator: " "))
}

print(result)