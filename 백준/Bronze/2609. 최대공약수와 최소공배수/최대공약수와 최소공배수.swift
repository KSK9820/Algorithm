let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
 
var gcd = 1
var lcm = 1
if min(n,m) == 1 {
    gcd = 1
} else {
    for i in 2...min(n, m) {
        if n % i == 0 && m % i == 0 {
            gcd = i
        }
    }
}
lcm = n / gcd * m
print(gcd)
print(lcm)