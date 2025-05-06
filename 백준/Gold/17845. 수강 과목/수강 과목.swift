let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])

var schedule = [(l: Int, t: Int)]()
for _ in 0..<k {
    let lt = readLine()!.split(separator: " ").map { Int($0)! }
    schedule.append((lt[0], lt[1]))
}

var dp = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)
for i in 1...k {
    let (l, t) = (schedule[i-1].l, schedule[i-1].t)
    
    for j in 0...n {
        if j < t {
            dp[i][j] = dp[i-1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j - t] + l)
        }
    }
}

print(dp[k][n])