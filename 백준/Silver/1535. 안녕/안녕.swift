
let n = Int(readLine()!)!
let l = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let j = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 100)

for i in 1...n {
    for k in 0...99 {
        if l[i] <= k {
            dp[k][i] = max(dp[k][i-1], dp[k-l[i]][i-1] + j[i])
        } else {
            dp[k][i] = dp[k][i-1]
        }
    }
}
print(dp[99][n])
