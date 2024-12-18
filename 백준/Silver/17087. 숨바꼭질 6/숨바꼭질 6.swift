let ns = readLine()!.split(separator: " ").map { Int($0)! }
let (n,s) = (ns[0], ns[1])

let a = readLine()!.split(separator: " ").map { Int($0)! }
var dis = a.map { abs($0 - s) }

if dis.count == 1 {
    print(dis[0])
} else {
    var value = gcd(dis[0], dis[1])
    for i in 2..<n {
        value = gcd(value, dis[i])
    }
    print(value)
}


func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}