let name = Array(readLine()!)
var count = Array(repeating: 0, count: 26)
for i in name {
    count[Int(i.asciiValue!) - 65] += 1
}
var limit = count.map { Double($0) / 2 }
let filtered = limit.enumerated().filter({ Double(Int($0.element)) != ($0.element) })
if filtered.count > 1 {
    print("I'm Sorry Hansoo")
} else if filtered.count == 1 {
    var result = ""
    limit[filtered[0].offset] = Double(Int(count[filtered[0].offset] / 2))
    for i in limit.enumerated() {
        for _ in 0..<Int(i.element) {
            result.append(String(UnicodeScalar(i.offset + 65)!))
        }
    }
    print(result + String(UnicodeScalar(filtered[0].offset + 65)!) + result.reversed())
} else {
    var result = ""
    for i in limit.enumerated() {
        for _ in 0..<Int(i.element) {
            result.append(String(UnicodeScalar(i.offset + 65)!))
        }
    }
    print(result + result.reversed())
}

