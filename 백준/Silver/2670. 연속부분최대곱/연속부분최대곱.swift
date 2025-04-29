import Foundation

let n = Int(readLine()!)!
var arr = [Double](repeating: 0.0, count: n)

for i in 0..<n {
    arr[i] = Double(readLine()!)!
}
var dp = Array(repeating: 1.0, count: n)
dp = arr

for i in 1..<n {
    dp[i] = max(dp[i], dp[i-1] * arr[i])
}

print(String(format: "%.3f", dp.max()!))
