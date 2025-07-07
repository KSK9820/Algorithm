let n = Int(readLine()!)!
var b = readLine()!.map { String($0) }

if b.filter({ $0 == "R" }).count == 0 || b.filter({ $0 == "B" }).count == 0 {
    print(0)
} else {
    let B = b.filter({ $0 == "B" }).count
    let R = b.filter({ $0 == "R" }).count
    
    let first = b.first
    let last = b.last
    var firstCount = 0
    var lastCount = 0
    for i in b.indices {
        if first == b[i] { firstCount += 1 } else { break }
    }
    for i in b.indices.reversed() {
        if last == b[i] { lastCount += 1 } else { break }
    }
    
    var resultFirst = 0
    var resultSecond = 0
    if first == "B" {
        resultFirst = min(B-firstCount, R)
    } else {
        resultFirst = min(R-firstCount, B)
    }
    
    if last == "B" {
        resultSecond = min(B-lastCount, R)
    } else {
        resultSecond = min(R-lastCount, B)
    }
    
    print(min(resultFirst, resultSecond))
}
