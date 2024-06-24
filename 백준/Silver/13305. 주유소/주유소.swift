
let n = Int(readLine()!)!
let load = readLine()!.split(separator: " ").map { Int($0)! }
let oil = readLine()!.split(separator: " ").map { Int($0)! }
var price = oil[0] * load[0]
var lowest = oil[0]

for i in 0..<n-2 {
    if lowest <= oil[i+1] {
        price += lowest * load[i+1]
    } else {
        lowest = oil[i+1]
        price += lowest * load[i+1]
    }
}


print(price)