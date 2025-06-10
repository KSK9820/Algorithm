
let n = Int(readLine()!)!
var word = [String:Int]()

let input = readLine()!.map { String($0) }
input.forEach {
    word[$0, default: 0] += 1
}

var result = 0
for _ in 0..<n-1 {
    let cw = readLine()!.map { String($0) }
    var w = word
    
    if abs(input.count - cw.count) >= 2 { continue }
    
    cw.forEach {
        w[$0, default: 0] -= 1
        if w[$0] == 0 { w[$0] = nil }
    }
    
    var dif = 0
    for value in w.values {
        dif += abs(value)
    }
    
    if dif <= 1 || (dif == 2 && cw.count == input.count) {
        result += 1
    }
}
print(result)

