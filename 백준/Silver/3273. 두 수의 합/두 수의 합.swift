let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var x = Int(readLine()!)!

var left = 0
var right = n-1
var result = 0
while left < right {
    var now = arr[left] + arr[right]
    if now == x {
        left += 1
        right -= 1
        result += 1
        continue
    }
    
    if now < x {
        left += 1
    } else {
        right -= 1
    }
    
}
print(result)