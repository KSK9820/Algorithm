let nk = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (nk[0], nk[1])
var coins = [Int]()
for i in 0..<n {
    coins.append(Int(readLine()!)!)
}
var result = 0
while k != 0 {
    result += k / coins.last!
    k = k % coins.last!
    coins.removeLast()
}
print(result)