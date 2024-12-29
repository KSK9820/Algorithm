import Foundation
var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var temp = 0
   
    let ds = findDivisors(n: n)
    for d in ds {
        if gcd(d, n/d) == 1 { temp += 1}
    }
    
    result += "\(temp)\n"
}
print(result)

func findDivisors(n: Int) -> [Int] {
    var divisors = [Int]()
    
    for i in 1...Int(sqrt(Double(n))) {
        if n % i == 0 {
            divisors.append(i)
        }
    }
    
    return divisors.sorted()
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}
