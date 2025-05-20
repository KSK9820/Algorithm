import Foundation

let t = Int(readLine()!)!
var arr = [Int](repeating: 0, count: t)

for i in 0..<t {
    arr[i] = Int(readLine()!)!
}

var p = [Bool](repeating: true, count: 1000001)
p[0] = false
p[1] = false

for i in 2...Int(sqrt(Double(1000000))) {
    if p[i] {
        var j = i * i
        while j <= 1000000 {
            p[j] = false
            j += i
        }
    }
}

var result = ""
for i in arr {
    var count = 0
    for j in 2...i/2 {
        if p[j] && p[i-j] {
            count += 1
        }
    }
    result += "\(count)\n"
}

print(result)
