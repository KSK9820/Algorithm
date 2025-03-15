let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let total = a.reduce(0, +)
var a1 = total - (a[0] + a[1]) + (a[0] * a[1] * 2)
var a2 = total - (a[n-1] + a[n-2]) + (a[n-1] * a[n-2] * 2)
print(max(total, a1, a2))
