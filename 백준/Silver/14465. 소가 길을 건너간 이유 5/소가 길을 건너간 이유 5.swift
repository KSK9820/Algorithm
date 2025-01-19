let knb = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k,b) = (knb[0], knb[1], knb[2])

var arr = [Int](repeating: 0, count: n)
for _ in 0..<b {
    arr[Int(readLine()!)!-1] = 1
}

var range = arr[0..<k].reduce(0, +)
var result = range
for i in k..<n {
    range = range + arr[i] - arr[i-k]
    result = min(result, range)
}
print(result)