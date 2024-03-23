let n = Int(readLine()!)!
var arr = [[Int]](repeating: [], count: n)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            if arr[a][i] == 1 && arr[i][b] == 1 {
                arr[a][b] = 1
            }
        }
    }
}

for i in arr {
    print(i.map { String($0) }.joined(separator: " "))
}
