import Foundation

func isPrime(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }
    for i in 2..<Int(sqrt(Double(n)) + 1) {
        if n % i == 0 { return false }
    }
    return true
}

var prime = [Bool](repeating: false, count: 10001)
for i in 2...10000 {
    prime[i] = isPrime(i)
}

let T = Int(readLine()!)!
var result = [(Int, Int)](repeating: (0, Int.max), count: T)
for t in 0..<T {
    let n = Int(readLine()!)!
    
    for i in 2..<n where i <= n - i {
        if prime[i] && prime[n-i] {
            if result[t].1 - result[t].0 > n - i * 2 {
                result[t] = (i, n-i)
            }
        }
    }
}
for i in result {
    print("\(i.0) \(i.1)")
}