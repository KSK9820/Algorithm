import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
var nums = Set([Int](2...n))


func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    for i in 2..<Int(sqrt(Double(n)) + 1) {
        if n % i == 0 { return false }
    }
    return true
}

var p = 1
var idx = 0
var r = 0
outer: while true {
    for i in (p+1)...n where p < n {
        if isPrime(i) {
            p = i
            break
        }
    }
    
    var tp = p
    while tp <= n {
        if nums.contains(tp) {
            nums.remove(tp)
            idx += 1
        }
        
        if idx == k {
            print(tp)
            break outer
        }
        
        tp += p
    }
}
