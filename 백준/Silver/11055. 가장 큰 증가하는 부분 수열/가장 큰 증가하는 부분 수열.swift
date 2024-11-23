let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n)

for i in 0..<n {
    dp[i] = a[i]
    for j in 0...i {
        if a[j] < a[i] {
            dp[i] = max(dp[i], dp[j] + a[i])
        }
    }
}
print(dp.max()!)
