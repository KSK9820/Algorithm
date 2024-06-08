
let n = Int(readLine()!)!
let narr = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let marr = readLine()!.split(separator: " ").map { Int($0)! }

var arr = [Int: Bool]()
for i in narr {
    arr[i] = true
}
var result = ""
for i in marr {
    if arr[i] != nil {
        result += "1\n"
    } else {
        result += "0\n"
    }
}
result.removeLast()
print(result)
