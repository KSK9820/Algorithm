import Foundation

let t = Int(readLine()!)!
var result = ""
var input = [Int]()
var primeCount = 0
var superPrime = [Int]()
for _ in 0..<t {
    input.append(Int(readLine()!)!)
}

for i in 2...318137 {
    if isPrime(i) {
        primeCount += 1
        if isPrime(primeCount) {
            superPrime.append(i)

        }
    }
}
for i in input {
    result.append("\(superPrime[i-1])\n")
}

print(result)

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false: true
    }
    for i in 2...Int(sqrt(Double(num))) + 1 {
        if num % i == 0 {
            return false
        }
    }
    return true
}