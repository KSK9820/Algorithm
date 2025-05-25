
let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var b = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
var w = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for i in 1...n {
    let input = readLine()!.map { String($0) }
    
    for j in 1...m {
        if (i+j) % 2 == 0 {
            if input[j-1] == "B" {
                w[i][j] = 1
            } else {
                b[i][j] = 1
            }
        } else {
            if input[j-1] == "W" {
                w[i][j] = 1
            } else {
                b[i][j] = 1
            }
        }
    }
}

for i in 1...n {
    for j in 1...m {
        b[i][j] += b[i-1][j] + b[i][j-1] - b[i-1][j-1]
        w[i][j] += w[i-1][j] + w[i][j-1] - w[i-1][j-1]
    }
}

var result = Int.max
for i in k...n {
    for j in k...m {
        let bb = b[i][j] - b[i-k][j] - b[i][j-k] + b[i-k][j-k]
        let ww = w[i][j] - w[i-k][j] - w[i][j-k] + w[i-k][j-k]
        
        result = min(bb, ww, result)
    }
}

print(result)