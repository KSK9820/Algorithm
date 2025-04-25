let n = Int(readLine()!)!
let box = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i where box[i] > box[j] {
        dp[i] = max(dp[j] + 1, dp[i])
    }
}

print(dp.max()!)
