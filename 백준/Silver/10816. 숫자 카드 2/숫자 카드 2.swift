
let n = Int(readLine()!)!
let narr = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let marr = readLine()!.split(separator: " ").map { Int($0)! }

var arr = [Int: Int]()

for i in narr {
    if arr[i] == nil {
        arr[i] = 1
    } else {
        arr[i]! += 1
    }
}

var result = [String]()
for i in marr {
    if arr[i] == nil {
        result.append("0")
    } else {
        result.append(String(arr[i]!))
    }
}
print(result.map { String($0) }.joined(separator: " "))
