let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n,q) = (nq[0], nq[1])
var c = Array(repeating: (0,0,0), count: n+1)
for i in 0..<n {
    let input = Int(readLine()!)! - 1
    c[i+1] = c[i]
    
    switch input {
    case 0:
        c[i+1].0 += 1
    case 1:
        c[i+1].1 += 1
    case 2:
        c[i+1].2 += 1
    default:
        break
    }
}

var result = ""
for _ in 0..<q {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = ""
    answer += "\(c[ab[1]].0 - c[ab[0] - 1].0)"
    answer += " \(c[ab[1]].1 - c[ab[0] - 1].1)"
    answer += " \(c[ab[1]].2 - c[ab[0] - 1].2)"
    
    result += answer
    result += "\n"
}

print(result)