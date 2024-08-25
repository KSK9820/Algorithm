let n = Int(readLine()!)!
var result = 0
for i in 1...n {
    let num = String(i).map { Int(String($0))! }
    if num.count < 3 { result += 1; continue }
    let dif = num[0] - num[1]
    var flag = true
    for j in 0..<num.count-1 {
        if dif != num[j] - num[j+1] { flag = false; break }
    }
    if flag { result += 1}
}
print(result)