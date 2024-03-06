let n = Int(readLine()!)!
var arr = [(day: Int, cost: Int)]()
for i in 0..<n {
    let tp = readLine()!.split(separator: " ").map { Int($0)! }
    if i + tp[0] > n {
        arr.append((0,0))
    } else {
        arr.append((tp[0], tp[1]))
    }
}

var dp = [Int](repeating: 0, count: n+1)
for i in (0..<n).reversed() {
    let nextDay = i + arr[i].day
    dp[i] = max(arr[i].cost + dp[nextDay], dp[i+1])
}
print(dp[0])