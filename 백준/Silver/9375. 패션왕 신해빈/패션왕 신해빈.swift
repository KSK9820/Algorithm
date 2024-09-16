var answer = ""
for _ in 0..<Int(readLine()!)! {
    var f = [String: Int]()
    for _ in 0..<Int(readLine()!)! {
        let input = readLine()!.split(separator: " ").map { String($0) }
        if f[input[1]] == nil {
            f[input[1]] = 1
        } else {
            f[input[1]]! += 1
        }
    }
    
    var result = 1
    for i in f {
        result *= (i.value + 1)
    }
    answer += "\(result-1)\n"
}
     print(answer)
