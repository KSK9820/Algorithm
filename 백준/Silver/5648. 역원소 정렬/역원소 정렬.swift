var arr = [String]()

while true {
    let n = readLine()!.split(separator: " ").map { String($0) }
    if n.isEmpty { continue }
    for i in n {
        arr.append(i)
    }
    if arr.count == Int(arr[0])! + 1 { break }
}

arr.removeFirst()
var rev = arr.map { Int(String($0.reversed()))! }.sorted()
print(rev.map { String($0) }.joined(separator: "\n"))