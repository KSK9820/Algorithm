let n = Int(readLine()!)!
let liquid = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

var left = 0
var right = n-1
var result: (v: Int, l1: Int, l2: Int) = (Int.max, left, right)
while left < right {
    let l = liquid[right] + liquid[left]
    if abs(l) < abs(result.v) {
        result = (l, left, right)
    }
    
    if l > 0 {
        right -= 1
    } else {
        left += 1
    }
}

print(liquid[result.l1], liquid[result.l2])
