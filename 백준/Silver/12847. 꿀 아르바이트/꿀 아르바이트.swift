let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var t = readLine()!.split(separator: " ").map { Int($0)! }

var c = 0
for i in 0..<m {
    c += t[i]
}

var result = c

for i in m..<n {
    c =  c + t[i] - t[i-m]
    result = max(result, c)
}
print(result)