let n = Int(readLine()!)!
var atm = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
print(atm.enumerated().map { $0.element * (n-$0.offset) }.reduce(0, +))