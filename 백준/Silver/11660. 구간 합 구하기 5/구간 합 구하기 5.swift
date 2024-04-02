let nm = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(repeating: Array(repeating: 0, count: nm[0]+1), count: nm[0]+1)

for i in 1...nm[0] {
    arr[i] = [0] + readLine()!.split(separator: " ").map { Int($0)! }
}


for i in 1...nm[0] {
    for j in 1...nm[0] {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

var result = [Int](repeating: 0, count: nm[1])
for j in 0..<nm[1] {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (xy[0], xy[1], xy[2], xy[3])
    
    result[j] = arr[x2][y2] - arr[x1-1][y2] - arr[x2][y1-1] + arr[x1-1][y1-1]
}

print(result.map { String($0) }.joined(separator: "\n"))
