let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var day = Array(repeating: 0, count: m+1)
var page = Array(repeating: 0, count: m+1)


var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for i in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    day[i] = input[0]
    page[i] = input[1]
}

for i in 1...m {
    for j in 0...n {
        if day[i] <= j {
            dp[j][i] = max(dp[j][i-1], dp[j-day[i]][i-1] + page[i])
        } else {
            dp[j][i] = dp[j][i-1]
        }
    }
}

print(dp[n][m])
