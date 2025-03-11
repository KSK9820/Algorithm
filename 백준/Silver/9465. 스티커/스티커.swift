var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    
    var s = Array(repeating: Array(repeating: 0, count: n), count: 2)
    for i in 0..<2 {
        s[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    if n == 1 {
        result += "\(max(s[0][0], s[1][0]))\n"
    } else {
        var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
        dp[0][0] = s[0][0]
        dp[1][0] = s[1][0]
        dp[0][1] = s[1][0] + s[0][1]
        dp[1][1] = s[0][0] + s[1][1]
        
        if n == 2 {
            result += "\(max(dp[0][1], dp[1][1]))\n"
        } else {
            for i in 2..<n {
                dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + s[0][i]
                dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + s[1][i]
            }
            
            result += "\(dp.flatMap { $0 }.max()!)\n"
        }
    }
}

print(result)