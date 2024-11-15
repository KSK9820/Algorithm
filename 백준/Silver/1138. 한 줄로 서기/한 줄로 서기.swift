let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: -1, count: n)

for i in 0..<n {
    var high = 0
    
    for j in 0..<n {
        if high == arr[i] {
            for k in j..<n {
                if result[k] == -1 {
                    result[k] = i
                    break
                }
            }
            break
        }
        if result[j] == -1 { high += 1 }
    }
    
}
print(result.map { String($0 + 1) }.joined(separator: " "))