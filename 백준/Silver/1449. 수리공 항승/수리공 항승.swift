let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n,l) = (nl[0],nl[1])
let water = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0

var s = 0
var e = s+1

while e <= n {
    if e == n {
        result += 1
        break
    }
    let d = water[e] - water[s]
    
    if d > l-1 {
        s = e
        e = s + 1
        result += 1
    } else if d == l-1 {
        s = e + 1
        e = s + 1
        result += 1
    } else {
        e += 1
    }
}
print(result)