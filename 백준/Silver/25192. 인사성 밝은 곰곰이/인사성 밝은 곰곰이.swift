let n = Int(readLine()!)!
var result = 0
var name = Set<String>()
for _ in 0..<n {
    let input = readLine()!
    
    if input == "ENTER" {
        name = []
    } else {
        if !name.contains(input) {
            name.insert(input)
            result += 1
        }
    }
}

print(result)
