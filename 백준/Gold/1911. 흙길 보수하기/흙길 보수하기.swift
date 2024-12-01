import Foundation

let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n,l) = (nl[0], nl[1])
var oong = [(s: Int, e: Int, d: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    oong.append((input[0], input[1], input[1] - input[0]))
}
oong.sort { $0.s < $1.s }

var result = 0
var board = (len: l * Int(ceil(Double(oong[0].d) / Double(l))), s: oong[0].s)

for i in 1..<n {
    if board.s + board.len < oong[i].e {
        if board.s + board.len > oong[i].s {
            board.len = Int(ceil(Double(oong[i].e - board.s) / Double(l))) * l
        } else {
            result += board.len / l
            board = (l * Int(ceil(Double(oong[i].d) / Double(l))), s: oong[i].s)
        }
    }
    
    if i == n-1 {
        result += board.len / l
    }
}

print(result)