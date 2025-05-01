
let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: abs(n)+2)
dp[0] = 0
dp[1] = 1

if n < -1 {
    for i in 0...(abs(n)-2) {
        dp[i+2] = (dp[i] - dp[i+1]) % 1_000_000_000
    }
    
} else if n == 0 {
    dp.append(0)
} else if n > 1 {
    for i in 2...n {
        dp[i] = (dp[i-1] + dp[i-2]) % 1_000_000_000
    }
}

if dp[abs(n)] > 0 {
    print(1)
} else if dp[abs(n)] == 0 {
    print(0)
} else {
    print(-1)
}
print(abs(dp[abs(n)]))

