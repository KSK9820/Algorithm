let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
var dp = Array(repeating: Array(repeating: [0,0,0], count: m), count: n)
for i in 0..<n {
    for j in 0..<m {
        dp[i][j] = [Int.max, Int.max, Int.max]
    }
}
dp[0] = arr[0].map { [$0,$0,$0] }
for i in 1..<n {
    for j in 0..<m {
        if j != 0 {
            dp[i][j][0] = min(dp[i-1][j-1][1], dp[i-1][j-1][2]) + arr[i][j]
        }
        dp[i][j][1] = min(dp[i-1][j][0], dp[i-1][j][2]) + arr[i][j]
        if j != m-1 {
            dp[i][j][2] = min(dp[i-1][j+1][0], dp[i-1][j+1][1]) + arr[i][j]
        }
    }
}
print(dp[n-1].flatMap { $0 }.min()!)
