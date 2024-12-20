let rg = readLine()!.split(separator: " ").map { Int($0)! }
let (r,g) = (rg[0], rg[1])

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

let maxValue = gcd(r, g)
var result = ""
for i in 1...maxValue {
    if r % i == 0 && g % i == 0 {
        result += "\(i) \(r/i) \(g/i)\n"
    }
}
print(result)
