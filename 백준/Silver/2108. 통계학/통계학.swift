import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)
var count = [Int: Int]()
for i in 0..<n {
    arr[i] = Int(readLine()!)!
    count[arr[i], default: 0] += 1
}
arr = arr.sorted()

print(Int(round(Double(arr.reduce(0, +)) / Double(n))))
print(arr[n/2])
let c = count.filter { $0.value == count.values.max()! }.sorted { $0.key < $1.key }
if c.count >= 2 {
    print(c[1].key)
} else {
    print(c[0].key)
}
print(abs(arr.last! - arr.first!))
