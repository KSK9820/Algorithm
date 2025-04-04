let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }



var dif = Array(repeating: 0, count: n)
for i in 1..<n {
    dif[i-1] = arr[i] - arr[i-1]
}
dif = dif.sorted(by: <)

var result = 0
for i in 0...n-k {
    result += dif[i]
}


print(result)
