import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

func comb(_ n: Int, _ m: Int) -> Decimal {
    let newm = min(m, n-m)
    
    if m == 0 { return 1 }
    if n == m { return 1 }
    
    var result = Decimal(1)
    
    for i in 1...newm {
        result *= Decimal(n-i+1)
        result /= Decimal(i)
    }

    return result
}

print(comb(n, m))
