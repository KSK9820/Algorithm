let n = Int(readLine()!)!
var l = [Int]()
for _ in 0..<n {
    l.append(Int(readLine()!)!)
}
l.sort(by: <)

var result = 0
for i in 0..<n {
    result = max(result, l[i] * (n-i))
}
print(result)
