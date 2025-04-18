let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])

var arr = Array(repeating: Array(repeating: 0, count: n), count: m)
for i in 0..<m {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let mx = [0,0,1,-1]
let my = [1,-1,0,0]

var dp = Array(repeating: Array(repeating: -1, count: n), count: m)

func dfs(_ y: Int, _ x: Int) -> Int {
    if x == n-1 && y == m-1 { return 1 }
    if dp[y][x] != -1 { return dp[y][x] }
    
    dp[y][x] = 0
    
    for i in 0..<4 {
        let newy = y + my[i]
        let newx = x + mx[i]
        
        if newy < 0 || newy >= m || newx < 0 || newx >= n { continue }
        if arr[y][x] <= arr[newy][newx] { continue }
        dp[y][x] += dfs(newy, newx)
    }
    return dp[y][x]
}

print(dfs(0, 0))

