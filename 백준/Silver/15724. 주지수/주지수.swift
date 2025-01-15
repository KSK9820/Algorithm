let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for i in 1...n {
    arr[i] = [0] + readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 1...n {
    for j in 1...m {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

let k = Int(readLine()!)!
var result = ""
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1,y1,x2,y2) = (input[0], input[1], input[2], input[3])
    
    let v = arr[x2][y2] - arr[x1-1][y2] - arr[x2][y1-1] + arr[x1-1][y1-1]

    result += "\(v)\n"
}

print(result)