
let n = Int(readLine()!)!
var dp = [[Int]](repeating: Array(repeating: 0, count: 10), count: n+1)

for i in 0..<9 {
    dp[1][i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            if j == 0 {
                dp[i][0] = dp[i-1][1] % 1_000_000_000
            } else if j == 9 {
                dp[i][9] = dp[i-1][8] % 1_000_000_000
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1_000_000_000
            }
        }
    }
}

print(dp[n].reduce(0, +) % 1_000_000_000)