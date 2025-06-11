import Foundation

var dic = [String: Int]()
while let line = readLine() {
    if line.isEmpty { break }
    dic[line, default: 0] += 1
}

let total = dic.values.reduce(0, +)
let s = dic.sorted { $0.key < $1.key }
var result = ""
for i in s {
    let p = String(format: "%.4f", (Double(i.value) / Double(total)) * 100)
    result += "\(i.key) \(p)\n"
}
print(result)

