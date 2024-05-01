let s = readLine()!.map { $0 }
var zeroCount = s.filter { $0 == "0" }.count
let zero = [String](repeating: "0", count: zeroCount / 2).joined()
let one = [String](repeating: "1", count: (s.count - zeroCount) / 2).joined()
print(zero + one)
