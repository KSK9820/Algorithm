
struct W: Hashable {
    var idx: [Int]
    var count: Int
}
var result = ""
for _ in 0..<Int(readLine()!)! {
    let w = readLine()!.map { String($0) }
    let k = Int(readLine()!)!
    var r1 = Int.max
    var r2 = Int.min
    var dic = [String: W]()
    if k == 1 {
        result += "1 1\n"
    } else {
        for i in 0..<w.count {
            var new = dic[w[i]]
            if new == nil {
                dic[w[i]] = W(idx: [i], count: 1)
            } else {
                new?.idx.append(i)
                new?.count += 1
                dic[w[i]] = new
                
                if dic[w[i]]!.idx.count >= k {
                    r1 = min(r1, dic[w[i]]!.idx[new!.idx.count - 1] - dic[w[i]]!.idx[new!.idx.count - k] + 1)
                    r2 = max(r2, dic[w[i]]!.idx[new!.idx.count - 1] - dic[w[i]]!.idx[new!.idx.count - k] + 1)
                }
            }
        }
        if r1 == Int.max || r2 == Int.min {
            result += "-1\n"
        } else {
            result += "\(r1) \(r2)\n"
        }
    }
}
print(result)
