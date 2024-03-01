let s = Int(readLine()!)!
var dp = [Int](repeating: 0, count: s)
var stair = [Int](repeating: 0, count: s)
for i in 0..<s {
    stair[i] = Int(readLine()!)!
}

for i in 0..<s {
    if i == 0 {
        dp[0] = stair[0]
        continue
    }
    if i == 1 {
        dp[1] = stair[0] + stair[1]
        continue
    }
    if i == 2 {
        dp[2] = max(stair[1], stair[0]) + stair[2]
        continue
    }
    
    let one = stair[i-1] + dp[i-3]
    let two = dp[i-2]
    dp[i] = max(one, two) + stair[i]
}
print(dp[s-1])
