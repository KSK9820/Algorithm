let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var arr = Array(repeating: Array(repeating: 0, count: m+2), count: n+2)
for i in 1...n {
    arr[i] = [0] + readLine()!.split(separator: " ").map { Int($0)! } + [0]
}


var result = n * m * 2

for i in 1...n {
    for j in 0...m {
        result += arr[i][j+1] - arr[i][j] > 0 ? arr[i][j+1] - arr[i][j] : 0
    }
    for j in stride(from: m+1, to: 0, by: -1) {
        result += arr[i][j-1] - arr[i][j] > 0 ? arr[i][j-1] - arr[i][j] : 0
    }
}
for i in 1...m {
    for j in stride(from: n+1, to: 0, by: -1)  {
        result += arr[j-1][i] - arr[j][i] > 0 ? arr[j-1][i] - arr[j][i] : 0
    }
    for j in 0...n {
        result += arr[j+1][i] - arr[j][i] > 0 ? arr[j+1][i] - arr[j][i] : 0
    }
}

print(result)