let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 10), count: n+1)

for i in 0...9 {
    arr[1][i] = 1
}
if n == 1 {
    print(10)
} else {
    for i in 2...n {
        for j in 0...9 {
            for k in 0...j {
                arr[i][j] += arr[i-1][k] % 10007
            }
        }
    }
    print(arr[n][0...9].reduce(0, +) % 10007)
}
