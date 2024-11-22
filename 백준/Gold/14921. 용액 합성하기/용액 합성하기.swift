let n = Int(readLine()!)!
let l = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = n-1
var result = Int.max
while left < right {
    let f = l[left] + l[right]
    if abs(result) > abs(f) {
        result = f
    }
    
    if f > 0 {
        right -= 1
    } else {
        left += 1
    }
}
print(result)