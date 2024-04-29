let t = Int(readLine()!)!
var result = [Int](repeating: 0, count: t)
for i in 0..<t {
    let n = Int(readLine()!)!
    let mbti = readLine()!.split(separator: " ").map { String($0).map { String($0) }}
    
    if n > 32 {
        result[i] = 0
        continue
    }
    
    var tmp = Int.max
    for m in 0..<n {
        for b in 0..<n {
            for t in 0..<n {
                if b == t || t == m || m == b { continue }
                let first = mbti[b].enumerated().filter { $0.element != mbti[t][$0.offset] }.count
                let second = mbti[t].enumerated().filter { $0.element != mbti[m][$0.offset] }.count
                let third = mbti[m].enumerated().filter { $0.element != mbti[b][$0.offset] }.count
                tmp = min(tmp, first + second + third)
            }
        }
    }
    result[i] = tmp
}

print(result.map { String($0) }.joined(separator: "\n"))