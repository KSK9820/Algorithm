var result = [0,1,2,4]
var number = [Int]()

for _ in 0..<Int(readLine()!)! {
    number.append(Int(readLine()!)!)
}
for i in 4...number.max()! {
    var temp = 0
    for j in 1...3 {
        temp += result[i-j]
    }
    result.append(temp)
}

var answer = number.map { String(result[$0]) }.joined(separator: "\n")
print(answer)