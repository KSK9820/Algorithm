let n = Int(readLine()!)!
var result = 0
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    var set = Set<String>()
    
    var bef = input[0]
    set.insert(bef)
    for i in 1..<input.count {
        if input[i] != bef {
            if set.contains(input[i]) {
                result -= 1
                break
            }
            set.insert(input[i])
            bef = input[i]
        }
    }
    result += 1
}

print(result)
