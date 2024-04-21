let nk = readLine()!.split(separator: " ").map { Int($0)! }
var triangle = [[Int]]()
for i in 0..<nk[0] {
    triangle.append(Array(repeating: 1, count: i+1))
}
for i in 1..<nk[0] {
    for j in 1..<i {
        triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j]
    }
}

print(triangle[nk[0]-1][nk[1]-1])