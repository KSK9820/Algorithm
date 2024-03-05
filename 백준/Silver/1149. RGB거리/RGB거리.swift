let n = Int(readLine()!)!
var rgb = [[Int]](repeating: [], count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    rgb[i] = input
}


var dp = [[Int]](repeating: [Int.max, Int.max, Int.max], count: n)
dp[0] = rgb[0]
for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + rgb[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + rgb[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + rgb[i][2]
}

print(dp[n-1].min()!)
