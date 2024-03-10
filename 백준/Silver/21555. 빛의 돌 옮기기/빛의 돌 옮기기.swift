let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [[Int]](repeating: [0,0], count: n)
dp[0] = [a[0],b[0]]

for i in 1..<n {
    dp[i][0] = min(dp[i-1][0], dp[i-1][1] + k) + a[i]
    dp[i][1] = min(dp[i-1][0] + k, dp[i-1][1]) + b[i]
}
print(dp[n-1].min()!)