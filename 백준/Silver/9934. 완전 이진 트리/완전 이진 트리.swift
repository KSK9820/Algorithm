let k = Int(readLine()!)!
let order = readLine()!.split(separator: " ").map { Int($0)! }

var result = Array(repeating: [], count: k)

func makeTree(s: Int, e: Int, d: Int) {
    if s == e {
        result[d].append(order[s])
        return
    }
    
    let root = (s+e)/2
    result[d].append(order[root])
    makeTree(s: s, e: root-1, d: d+1)
    makeTree(s: root+1, e: e, d: d+1)
}

makeTree(s: 0, e: order.count-1, d: 0)
var answer = ""
for i in 0..<k {
    answer += result[i].map { String(describing: $0) }.joined(separator: " ")
    answer += "\n"
}
print(answer)