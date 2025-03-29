let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var left = 0
var right = n-1

var result = 0
while left < right {
    if a[left] + a[right] >= m {
        result += 1
        left += 1
        right -= 1
        continue
    } else {
        left += 1
    }
}

print(result)
