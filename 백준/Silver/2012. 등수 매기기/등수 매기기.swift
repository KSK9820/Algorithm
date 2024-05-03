let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: n)

for i in 0..<n {
    arr[i] = Int(readLine()!)!
}
arr.sort()
var compare = [Bool](repeating: false, count: n+1)
var result = 0
for i in 1...n {
    result += abs(arr[i-1] - i)
}
print(result)