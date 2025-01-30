var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: 21), count: 21), count: 21)
var result = ""


while true {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    if abc == [-1, -1, -1] { break }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    
    result += "w(\(a), \(b), \(c)) = \(w(a,b,c))\n"
}

print(result)

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        dp[0][0][0] = 1
        return dp[0][0][0]
    }
    
    if a > 20 || b > 20 || c > 20 {
        if dp[20][20][20] == -1 {
            dp[20][20][20] = w(20,20,20)
        }
        return dp[20][20][20]
    }
    
    if dp[a][b][c] != -1 {
        return dp[a][b][c]
    }

    if a < b && b < c {
        dp[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
        return dp[a][b][c]
    }
    
    dp[a][b][c] =  w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
    return dp[a][b][c]
}
