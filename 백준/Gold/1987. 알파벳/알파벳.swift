let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c) = (rc[0], rc[1])
var arr = Array(repeating: Array(repeating: 0, count: c), count: r)
for i in 0..<r {
    arr[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

var result = 1

func dfs(_ y: Int, _ x: Int, _ count: Int, _ mask: Int) {
    result = max(result, count)
    if result == 26 {
        return
    }
    
    for i in 0..<4 {
        let newy = y + my[i]
        let newx = x + mx[i]
        
        if newy < 0 || newx < 0 || newy >= r || newx >= c { continue }
        
        let charBit = 1 << arr[newy][newx]
        if mask & charBit == 0 {
            dfs(newy, newx, count + 1, mask | charBit)
        }
    }
}
dfs(0, 0, 1, 1 << arr[0][0])

print(result)