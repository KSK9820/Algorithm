let n = readLine()!.map { Int(String($0))! }
var number = Array(repeating: 0, count: 10)
for i in n {
    number[i] += 1
}

var maximum = 0
var sixnine = (number[6] + number[9] + 1) / 2
for i in 0..<9 where i != 6 {
    maximum = max(maximum, number[i])
}
print(max(maximum,sixnine))