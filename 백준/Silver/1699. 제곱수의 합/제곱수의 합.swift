import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n+1)
dp[0] = 0
for i in 1...n {
    dp[i] = i
    
    for j in 1...Int(sqrt(Double(i))) {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
    }
}
print(dp[n])