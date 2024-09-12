var answer = ""
for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m) = (nm[0], nm[1])
    
    if m==n {
        answer += "1\n"
        continue
    }
    
    let r = min(n, m-n)
    var result = 1
    for i in 0..<r {
        result *= (m-i)
        result /= (i+1)
    }
   answer += "\(result)\n"

}
print(answer)
