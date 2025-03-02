import Foundation

let n = Int(readLine()!)!
var result = 0
var t = Array(repeating: 0, count: n+1)
t[0] = 1
if n > 0 {
    for i in 1...n {
        for j in 0..<i {
            t[i] += t[j] * t[i-j-1]
        }
    }
}
print(t[n])