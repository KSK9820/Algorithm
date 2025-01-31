let kl = readLine()!.split(separator: " ").map { Int($0)! }
let (k,l) = (kl[0], kl[1])
var dict = [String: Int]()
for i in 0..<l {
    dict[String(readLine()!)] = i
}
let sorted = Array(dict.sorted { $0.value < $1.value })
var result = ""

for i in 0..<min(k,l,sorted.count) {
    result += "\(sorted[i].key)\n"
}
print(result)
