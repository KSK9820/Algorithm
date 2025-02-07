import Foundation

let m = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
let k = Int(readLine()!)!

var total = arr.reduce(0, +)

var c = Array(repeating: Array(repeating: Decimal(0), count: total+1), count: total+1)

for i in 0...total {
    for j in 0...total {
        if i == 0 || j == 0 || i == j {
            c[i][j] = 1
        } else {
            c[i][j] = c[i-1][j-1] + c[i-1][j]
        }
    }
}

let tp = c[total][k]
var sp = Decimal(0)
arr.forEach {
    if $0 >= k {
        sp += c[$0][k]
    }
}
print(sp / tp)
