let n = Int(readLine()!)!
var dict = [String: Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: ".").map { String($0) }
    dict[input[1], default: 0] += 1
}

var sorted = Array(dict.sorted { $0.key < $1.key })
var result = ""
sorted.forEach {
    result += "\($0.key) \($0.value)\n"
}
print(result)

