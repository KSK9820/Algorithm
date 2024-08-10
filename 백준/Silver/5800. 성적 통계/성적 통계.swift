let k = Int(readLine()!)!
var result = ""
for i in 1...k {
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    arr.removeFirst()
    arr = arr.sorted(by: <)
    
    var interval = 0
    for j in 0..<arr.count-1 {
        interval = max(arr[j+1]-arr[j], interval)
    }
    result += "Class \(i)\n"
    let x = arr.last!
    let n = arr.first!
    result += "Max \(x), Min \(n), Largest gap \(interval)\n"
}
result.removeLast()
print(result)