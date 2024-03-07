let t = Int(readLine()!)!
for _ in 0..<t {
    let _ = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let money = Int(readLine()!)!
    
    var dp = [Int](repeating: 0, count: money+1)
    dp[0] = 1
    
    for j in coins {
        if j > money { continue }
        for i in j...money {
            dp[i] += dp[i-j]
        }
    }
    print(dp[money])
}
