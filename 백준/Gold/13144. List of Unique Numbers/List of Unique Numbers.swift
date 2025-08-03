let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }

var l = 0
var r = 0
var s = Set<Int>()
var result = 0
while l <= r {
    if r == n {
        result += (0...(n-l)).reduce(0, +)
        break
    } else if s.contains(a[r]) {
        result += r - l
        s.remove(a[l])
        l += 1
    } else {
        s.insert(a[r])
        r += 1
    }
}
print(result)
