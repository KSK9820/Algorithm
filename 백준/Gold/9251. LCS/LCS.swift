let str1 = readLine()!.map { String($0) }
let str2 = readLine()!.map { String($0) }

var dp = Array(repeating: Array(repeating: 0, count: str2.count+1), count: str1.count+1)

for i in 1...str1.count {
    for j in 1...str2.count {
        if str1[i-1] == str2[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[str1.count][str2.count])
