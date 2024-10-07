var answer = ""
for _ in 0..<Int(readLine()!)! {
    let cv = readLine()!.split(separator: " ").map { Int($0)! }
    let (c,v) = (cv[0], cv[1])
    
    var vote = Array(repeating: Array(repeating: 0, count: c), count: v)
    for i in 0..<v {
        vote[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }

    var result = Array(repeating: 0, count: c+1)
    for i in 0..<v {
        result[vote[i][0]] += 1
    }
    
    if Double(result.max()!) >= Double(v)/2.0 {
        answer += "\(result.firstIndex(of: result.max()!)!) 1\n"
    } else {
        let first = result.firstIndex(of: result.max()!)!
        
        var t = (element: 0, offset: 0)
        for i in result.enumerated() where i.offset != first {
            if i.element > t.element {
                t.element = i.element
                t.offset = i.offset
            }
        }
        var second = t.offset
        var count = [0,0]
        for i in 0..<v {
            if vote[i].firstIndex(of: first)! < vote[i].firstIndex(of: second)! {
                count[0] += 1
            } else {
                count[1] += 1
            }
        }
        if count[0] > count[1] {
            answer += "\(first) 2\n"
        } else {
            answer += "\(second) 2\n"
        }
    }
}
print(answer)
