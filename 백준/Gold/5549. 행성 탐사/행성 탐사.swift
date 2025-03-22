let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let k = Int(readLine()!)!

var arr = Array(repeating: Array(repeating: "", count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { String($0) }
}

var map = Array(repeating: Array(repeating: [0,0,0], count: m+1), count: n+1)
var h = Array(repeating: Array(repeating: [0,0,0], count: m+1), count: n+1)
var v = Array(repeating: Array(repeating: [0,0,0], count: m+1), count: n+1)

for i in 1...n {
    for j in 1...m {
        var nh = h[i][j-1]
        var nv = v[i-1][j]
        if arr[i-1][j-1] == "J" {
            nh[0] += 1
            nv[0] += 1
        } else if arr[i-1][j-1] == "O" {
            nh[1] += 1
            nv[1] += 1
        } else if arr[i-1][j-1] == "I" {
            nh[2] += 1
            nv[2] += 1
        }
        h[i][j] = nh
        v[i][j] = nv
    }
}

for i in 1...n {
    for j in 1...m {
        var result = [0,0,0]
        for k in 0..<3 {
          result[k] = map[i-1][j-1][k] + v[i][j][k] + h[i][j][k]
        }
        if arr[i-1][j-1] == "J" {
            result[0] -= 1
        } else if arr[i-1][j-1] == "O" {
            result[1] -= 1
        } else {
            result[2] -= 1
        }
        
        map[i][j] = result
    }
}

var answer = ""
for _ in 0..<k {
    let abcd = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b,c,d) = (abcd[0], abcd[1], abcd[2], abcd[3])
    var result = map[c][d]
    
    for k in 0..<3 {
      result[k] -= (map[a-1][d][k] + map[c][b-1][k])
      result[k] += map[a-1][b-1][k]
    }

    answer += "\(result.map { String($0) }.joined(separator: " "))\n"
}
print(answer)
