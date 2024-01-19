let n = Int(readLine()!)!
var result = 0
for i in 1...n {
    let arr = Array(String(i)).map { Int(String($0))! }
    if n == arr.reduce(0, +) + i {
        result = i
        break
    }
}
print(result)