let n = Int(readLine()!)!
let w = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = Array(repeating: 0, count: n)
for i in 0..<n {
    result[i] = w[i] + w[2 * n - i - 1]
}
print(result.min()!)
