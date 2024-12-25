let n = Int(readLine()!)!

var top = [Int]()
var bottom = [Int]()
var commonB = 1

for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b) = (ab[0], ab[1])

    top.append(a)
    bottom.append(b)
    
    commonB = lcm(commonB, b/gcd(a,b))
}

var commonT = 0
for i in 0..<n {
    top[i] = top[i] * commonB / bottom[i]
    if i == 0 {
        commonT = top[i]
    } else {
        commonT = gcd(commonT, top[i])
    }
}

print(commonT, commonB)

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a*b) / gcd(a,b)
}
