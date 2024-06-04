let n = Int(readLine()!)!
var triangle = [[Int]]()
for _ in 0..<n {
    triangle.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in (0..<n-1).reversed() {
    for j in (0...i) {
        triangle[i][j] += max(triangle[i+1][j], triangle[i+1][j+1])
    }
}
print(triangle[0][0])
