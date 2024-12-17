let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b) = (ab[0], ab[1])
let cd = readLine()!.split(separator: " ").map { Int($0)! }
let (c,d) = (cd[0], cd[1])

let bottom = b * d
let top = a * d + c * b


func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a}
    return gcd(b, a%b)
}

let div = gcd(top, bottom)
print("\(top / div) \(bottom / div)")
