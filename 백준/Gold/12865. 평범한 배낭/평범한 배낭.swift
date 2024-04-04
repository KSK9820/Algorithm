
let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var bag = [(w: Int, v: Int)](repeating: (0,0), count: n+1)

for i in 1...n {
    let wv = readLine()!.split(separator: " ").map { Int($0)! }
    if wv[0] > k {
        bag[i] = (wv[0], 0)
    } else {
        bag[i] = (wv[0], wv[1])
    }
}

var result = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)

for i in 1...n {
    for j in 1...k {
        if j >= bag[i].w {
            result[i][j] = max(result[i-1][j], result[i-1][j-bag[i].w] + bag[i].v)
        } else {
            result[i][j] = result[i-1][j]
        }
    }
}
print(result[n][k])

