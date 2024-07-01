let t = Int(readLine()!)!
var answer = [String]()
for _ in 0..<t {
    let n = Int(readLine()!)!
    let price = readLine()!.split(separator: " ").map { Int($0)! }
    
    var result = 0
    var count = 0
    var tempPrice = 0
    var high = price[n-1]
   
    for i in (0..<n-1).reversed() {
        if high > price[i] {
            count += 1
            tempPrice += price[i]
        } else {
            result += high * count - tempPrice
            count = 0
            tempPrice = 0
            high = price[i]
        }
    }
    if price[0] < high {
        result += high * count - tempPrice
    }
    answer.append(String(result))
}
print(answer.joined(separator: "\n"))

