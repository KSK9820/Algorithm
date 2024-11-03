let n = Int(readLine()!)!
let drink = readLine()!.split(separator: " ").map { Double($0)! }.sorted(by: >)
var result = drink[0]

for i in 1..<n {
    result += drink[i] / 2
}

print(result)
