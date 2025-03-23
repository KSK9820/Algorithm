let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for i in 1...n {
    arr[i] = [0] + readLine()!.split(separator: " ").map { Int($0)! }
}

var h = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var v = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var a = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for i in 1...n {
    for j in 1...n {
        h[i][j] = h[i][j-1] + arr[i][j]
        v[i][j] = v[i-1][j] + arr[i][j]
    }
}

for i in 1...n {
    for j in 1...n {
        a[i][j] = a[i-1][j-1] + h[i][j] + v[i][j] - arr[i][j]
    }
}

var result = -Int.max
for i in 1...n {
    for y in i...n {
        for x in i...n {
            let cost = a[y][x] - a[y-i][x] - a[y][x-i] + a[y-i][x-i]
            result = max(result, cost)
        }
    }
}

print(result)
