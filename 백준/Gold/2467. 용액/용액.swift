let n = Int(readLine()!)!
let s = readLine()!.split(separator: " ").map { Int($0)! }

var l = 0
var r = n-1
var total = Int.max
var result = ""
while l < r {
    if total > abs(s[l] + s[r]) {
        result = "\(s[l]) \(s[r])"
        total = abs(s[l] + s[r])
    }
    
    if s[l] + s[r] > 0 {
        r -= 1
    } else {
        l += 1
    }
}
print(result)
