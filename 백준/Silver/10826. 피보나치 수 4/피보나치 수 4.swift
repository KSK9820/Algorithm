
let n = Int(readLine()!)!
var dp = Array(repeating: [Int](), count: n+1)
if n == 0 {
    print(0)
} else if n <= 2 {
    print(1)
} else {
    dp[1] = [1]
    dp[2] = [1]
    
    for i in 3...n {
        dp[i] = calculate(a: dp[i-1].reversed(), b: dp[i-2].reversed())
    }
    
    print(dp[n].map { String($0) }.joined())
}

func calculate(a: [Int], b: [Int]) -> [Int] {
    var new = [Int](repeating: 0, count: max(a.count, b.count) + 1)
    
    for i in 0..<min(a.count, b.count) {
        new[i] += a[i] + b[i]
        if new[i] >= 10 {
            new[i+1] += 1
            new[i] -= 10
        }
    }
    
    if a.count > b.count {
        for i in b.count..<a.count {
            new[i] += a[i]
            
            if new[i] >= 10 {
                new[i] -= 10
                new[i+1] += 1
            }
        }
    } else if a.count < b.count {
        for i in a.count..<b.count {
            new[i] += b[i]
            
            if new[i] >= 10 {
                new[i] -= 10
                new[i+1] += 1
            }
        }
    }
    
    while new.last == 0 {
        new.removeLast()
    }
    
    return new.reversed()
}
