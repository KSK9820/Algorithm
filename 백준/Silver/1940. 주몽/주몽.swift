let n = Int(readLine()!)!
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var left = 0
var right = n - 1
var count = 0
while left < right {
    let value = arr[left] + arr[right]
    if value == m {
        left += 1
        right -= 1
        count += 1
    } else if value < m {
        left += 1
    } else {
        right -= 1
    }
}
print(count)