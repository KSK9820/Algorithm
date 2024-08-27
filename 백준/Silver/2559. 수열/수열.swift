let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var t = readLine()!.split(separator: " ").map { Int($0)! }

var c = 0
for i in 0..<k {
    c += t[i]
}

var result = c

for i in k..<n {
    c =  c + t[i] - t[i-k]
    result = max(result, c)
}
print(result)