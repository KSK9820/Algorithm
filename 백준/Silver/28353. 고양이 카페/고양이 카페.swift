let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
let w = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

var left = 0
var right = n-1
var result = 0

while left < right {
    if w[left] + w[right] <= k {
        result += 1
        left += 1
        right -= 1
    } else {
        right -= 1
    }
}
print(result)
