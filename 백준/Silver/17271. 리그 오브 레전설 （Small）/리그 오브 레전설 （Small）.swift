let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var dp = Array(repeating: 1, count: 10001)

for i in 1...n {
    dp[i] = dp[i-1]
    
    if i-m >= 0 {
        dp[i] = (dp[i] % 1000000007 + dp[i-m] % 1000000007) % 1000000007
    }
}
print(dp[n])
