
var ds = [Int](repeating: 1, count: 1_000_001)
ds[0] = 0

for i in 2...1_000_000 {
    var j = i
    while j <= 1_000_000 {
        ds[j] += i
        j += i
    }
}

var ns = [Int](repeating: 0, count: 1_000_001)
for i in 1...1_000_000 {
    ns[i] = ns[i-1] + ds[i]
}

var result = ""
for _ in  0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    result += "\(ns[n])\n"
}
print(result)
