let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
let b = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by : <)

var result = a.enumerated().map { $0.element * b[$0.offset] }.reduce(0, +)
print(result)