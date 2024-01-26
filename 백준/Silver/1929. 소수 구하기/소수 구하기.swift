import Foundation

let mn = readLine()!.split(separator:" ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
var 소수 = ""

for i in m...n {
    if i == 1 {
        continue
    }
    if i <= 3 {
        print(i)
        continue
    }
    var result = true
    for j in 2...Int(sqrt(Double(i))){
        if i % j == 0 {
            result = false
            break
        }
    }
    if result == true {
        소수.append("\(i)\n")
    }
}
print(소수)

