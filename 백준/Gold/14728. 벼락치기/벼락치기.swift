let nt = readLine()!.split(separator: " ").map { Int($0)! }
let (n,t) = (nt[0], nt[1])

var units: [(time: Int, score: Int)] = []
for _ in 0..<n {
    let ks = readLine()!.split(separator: " ").map { Int($0)! }
    units.append((ks[0], ks[1]))
}

var dp = Array(repeating: Array(repeating: 0, count: t+1), count: n+1)
for i in 1...n {
    let (time, score) = units[i-1]
    
    for j in 0...t {
        if j < time {
            dp[i][j] = dp[i-1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-time] + score)
        }
    }
}


print(dp[n][t])
