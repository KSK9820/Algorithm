let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int]()

for i in 0..<n {
    dp.append(1)
    for j in 0..<i+1 {
        if a[j] < a[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp.max()!)