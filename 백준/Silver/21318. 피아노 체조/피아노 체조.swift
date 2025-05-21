let n = Int(readLine()!)!
var arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n+1)
for i in 1...n {
    if arr[i] >= arr[i-1] {
        dp[i] = dp[i-1]
    } else {
        dp[i] = dp[i-1] + 1
    }
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x,y) = (xy[0], xy[1])
    
    result += "\(dp[y] - dp[x])\n"
    
}
print(result)