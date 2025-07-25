
var result = ""
for _ in 0..<Int(readLine()!)!{
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m) = (nm[0], nm[1])
    
    if n == 1 || m == 1 { result += "YES\n"; continue }
    
    result += abs(n - m) % 2 == 1 ? "YES\n" : "NO\n"
}

print(result)