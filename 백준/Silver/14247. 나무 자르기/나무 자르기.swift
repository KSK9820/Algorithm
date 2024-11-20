let n = Int(readLine()!)!
var h = readLine()!.split(separator: " ").map { Int($0)! }
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }

var result = h.reduce(0, +)
for i in 0..<n {
    result += a[i] * i
}
        
print(result)