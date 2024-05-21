let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(Set(arr)).sorted()
print(result.map { String($0) }.joined(separator: " "))