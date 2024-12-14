var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
        
    var p = [Int](repeating: 1, count: n+1)
    if n > 5 {
        p[4] = 2
        p[5] = 2
        var idx = 6
        
        while idx <= n {
            p[idx] = p[idx-1] + p[idx-5]
            idx += 1
        }
    } else if n > 4 {
        p[4] = 2
        p[5] = 2
    } else if n > 3 {
        p[4] = 2
    }
    result += "\(p[n])\n"
}
result.removeLast()
print(result)
