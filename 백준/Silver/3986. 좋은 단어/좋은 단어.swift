let n = Int(readLine()!)!
var result = 0

for _ in 0..<n {
    let word = readLine()!.map { String($0) == "A" ? 1 : 2 }
    var stack = [Int]()
    for i in word {
        if stack.isEmpty {
            stack.append(i)
            continue
        }
        
        if stack.last == i {
            stack.popLast()
        } else {
            stack.append(i)
        }
    }
    
    if stack.isEmpty { result += 1}
}
print(result)
