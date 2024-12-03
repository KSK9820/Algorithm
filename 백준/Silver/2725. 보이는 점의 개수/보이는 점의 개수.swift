var dp = [Int](repeating: 0, count: 1001)
dp[0] = 0
for i in 1...1000 {
    var count = 0
    for j in 0..<i {
        if gcd(i,j) == 1 {
            count += 1
        }
    }
    dp[i] = dp[i-1] + count
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    result += "\(dp[n] * 2 + 1)\n"
}
print(result)

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a}
    return gcd(b, a%b)
}