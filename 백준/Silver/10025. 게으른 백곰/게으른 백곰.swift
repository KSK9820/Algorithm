import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])

var ice = Array(repeating: 0, count: 1_000_001)

for _ in 0..<n {
    let gx = readLine()!.split(separator: " ").map { Int($0)! }
    var (g,x) = (gx[0], gx[1])
    
    ice[x] = g
}

var dp = ice
for i in 1...1_000_000 {
    dp[i] += dp[i - 1]
}
var result = -Int.max
for i in 0...1_000_000 {
    let left = max(0, i-k)
    let right = min(1_000_000, i+k)

    result = max(result, dp[right] - (left > 0 ? dp[left - 1] : 0))
}
print(result)

