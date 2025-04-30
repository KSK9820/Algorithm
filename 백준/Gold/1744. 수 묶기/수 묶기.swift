let n = Int(readLine()!)!
var plus = [Int]()
var minus = [Int]()
var zero = 0
var one = 0

for _ in 0..<n {
    let num = Int(readLine()!)!
    if num < 0 {
        minus.append(num)
    } else if num == 0 {
        zero += 1
    } else if num == 1 {
        one += 1
    } else {
        plus.append(num)
    }
}

minus = minus.sorted(by: <)
plus = plus.sorted(by: >)

var result = 0
for i in 0..<minus.count / 2 {
    result += minus[2 * i] * minus[2 * i + 1]
}
if minus.count % 2 != 0 {
    if zero == 0 {
        result += minus.last!
    }
}

for i in 0..<plus.count / 2 {
    result += plus[2 * i] * plus[2 * i + 1]
}
if plus.count % 2 != 0 {
    result += plus.last!
}
result += one

print(result)