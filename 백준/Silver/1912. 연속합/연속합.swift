let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var ac = arr

var result = ac[0]
for i in 1..<n {
    result = max(result, ac[i])
    if ac[i] + ac[i-1] >= ac[i] {
        ac[i] += ac[i-1]
        result = max(ac[i], result)
    }
}
print(result)
