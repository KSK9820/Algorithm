let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var comb = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for i in 0...n {
    for j in 0...n {
        if i == 0 || j == 0 || i == j {
            comb[i][j] = 1
        } else {
            comb[i][j] = (comb[i-1][j-1] % 10007 + comb[i-1][j] % 10007) % 10007
        }
    }
}
print(comb[n][m])