let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: n+1)
for i in 1...n {
    arr[i] = Int(readLine()!)!
}
var result = [Int](repeating: 0, count: n+1)
for i in 1...n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            result[i] = max(result[i], result[j] + arr[i])
        }
    }
}

print(result.max()!)