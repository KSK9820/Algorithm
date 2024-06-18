var n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr = arr.reversed()
var result = 0
for i in 0..<n-1 {
    if arr[i] <= arr[i+1] {
        result += arr[i+1] - arr[i] + 1
        arr[i+1] -= (arr[i+1] - arr[i] + 1)
    }
}
print(result)
