let n = Int(readLine()!)!
var arr = [Int]()
for i in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr = arr.sorted()
print(arr.map { String($0) }.joined(separator: "\n"))