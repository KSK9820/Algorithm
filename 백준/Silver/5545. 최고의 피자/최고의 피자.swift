import Foundation

let n = Int(readLine()!)!
let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b) = (ab[0], ab[1])
let c = Int(readLine()!)!
var topping = [Double]()
for _ in 0..<n {
    topping.append(Double(Int(readLine()!)!))
}

topping = topping.sorted(by : >)
var result = Double(c) / Double(a)
var cal = Double(c)
for i in 0..<n {
    let value = (cal + topping[i]) / Double(a + (i+1) * b)
    if value < result { break }
    result = value
    cal = cal + topping[i]
}
print(Int(trunc(result)))