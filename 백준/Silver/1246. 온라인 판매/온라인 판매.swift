let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var cost = [Int]()
for i in 0..<m {
    cost.append(Int(readLine()!)!)
}
cost.sort(by: >)

var income = 0
var price = 0
for i in 1...m {
    if n < i { break }
    if income <= i * cost[i-1] {
        income = i * cost[i-1]
        price = cost[i-1]
    }
}

print("\(price) \(income)")