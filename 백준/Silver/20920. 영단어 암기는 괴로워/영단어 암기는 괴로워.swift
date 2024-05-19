let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var counting: [String: Int] = [:]
var rsult = [String]()
for _ in 0..<n {
    let input = readLine()!
    if input.count < m { continue }
    if counting[input] != nil {
        counting[input]! += 1
    } else {
        counting[input] = 1
    }
}

var sortedCounting = counting
    .sorted { $0.key < $1.key}
    .sorted { $0.key.count > $1.key.count }
    .sorted { $0.value > $1.value }
print(sortedCounting.map { $0.key }.joined(separator: "\n"))
