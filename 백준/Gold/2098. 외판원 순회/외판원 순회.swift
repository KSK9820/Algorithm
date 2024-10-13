let n = Int(readLine()!)!
var weight = Array(repeating: Array(repeating: 0, count: n), count: n)
var dp = Array(repeating: Array(repeating: Int.max, count: n), count: (1 << n))

for i in 0..<n {
    weight[i] = readLine()!.split(separator: " ").map { Int($0)! }
}


dp[1][0] = 0
for mask in 0..<(1 << n) {
    for u in 0..<n {
        if (mask & (1 << u)) == 0 || dp[mask][u] == Int.max { continue }
        for v in 0..<n {
            if (mask & (1 << v)) != 0 || weight[u][v] == 0 { continue }
            
            let newMask = mask | (1 << v)
            let newCost = dp[mask][u] + weight[u][v]
            
            if dp[newMask][v] > newCost {
                dp[newMask][v] = newCost
            }
        }
    }
}

var minCost = Int.max

for i in 0..<n {
    if dp[(1 << n) - 1][i] != Int.max && weight[i][0] > 0 {
        minCost = min(minCost, dp[(1 << n) - 1][i] + weight[i][0])
    }
}

print(minCost)