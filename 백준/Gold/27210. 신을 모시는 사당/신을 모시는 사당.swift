let n = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var s = (l: 0, r: 0)
var result = 0
for i in 1...n {
    if arr[i] == 1 {
        s.l += 1
        if s.r > 0 {
            s.r -= 1
        }
    } else {
        if s.l > 0 {
            s.l -= 1
        }
        s.r += 1
    }
    result = max(result, s.l, s.r)
}
print(result)