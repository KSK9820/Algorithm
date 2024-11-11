let n = Int(readLine()!)!
var l = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = 0
for i in 1..<n {
    result += l[i-1] + l[i]
    l[i] = l[i-1]
}
print(result)