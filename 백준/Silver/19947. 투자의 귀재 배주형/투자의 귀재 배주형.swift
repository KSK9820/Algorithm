let hy = readLine()!.split(separator:" ").map { Int($0)! }
let (h, y) = (hy[0], hy[1])

var money = [Int](repeating: h, count: y+6)

money[1] = Int(Double(money[0]) * 1.05)
money[2] = Int(Double(money[1]) * 1.05)
money[3] = max(Int(Double(money[2]) * 1.05), Int(Double(money[0]) * 1.2))
money[4] = max(Int(Double(money[3]) * 1.05), Int(Double(money[1]) * 1.2))

if y >= 5 {
    for i in 5...y {
        money[i] = max(Int(Double(money[i-1]) * 1.05), Int(Double(money[i-3]) * 1.2), Int(Double(money[i-5]) * 1.35))
    }
}

print(Int(money[y]))