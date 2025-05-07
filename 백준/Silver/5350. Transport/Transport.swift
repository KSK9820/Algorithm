
var result = ""
for _ in 0..<Int(readLine()!)! {
    let nW = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,W) = (nW[0], nW[1])
    
    var items = [(w: Int, v: Int)]()
    for _ in 0..<n {
        let wv = readLine()!.split(separator: " ").map { Int($0)! }
        items.append((wv[0], wv[1]))
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: W+1), count: n+1)
    
    for i in 1...n {
        let (w,v) = (items[i-1].w, items[i-1].v)
        
        for j in 0...W {
            if j < w {
                dp[i][j] = dp[i-1][j]
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-w] + v)
            }
        }
    }
    result += "\(dp[n][W])\n"
}
print(result)
