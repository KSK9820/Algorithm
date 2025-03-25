let n = Int(readLine()!)!
let t = readLine()!.split(separator: " ").map { Int($0)! }
let c = Int(readLine()!)!

var ac = t
for i in 1..<c {
    ac[i] += ac[i-1]
}
for i in c..<n {
    ac[i] = ac[i-1] + ac[i] - t[i-c]
}
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 4)
for i in 1...3 {
    for j in i*c...n {
        dp[i][j] = max(dp[i][j-1], dp[i-1][j-c] + ac[j-1])
    }
}
print(dp[3][n])
