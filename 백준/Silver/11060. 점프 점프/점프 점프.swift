let n = Int(readLine()!)!
let miro = readLine()!.split(separator: " ").map { Int($0)! }
var count = Array(repeating: 100001, count: n)
count[0] = 0
for j in 0..<n {
    for i in 0...miro[j] where i + j < n {
        count[j+i] = min(count[j] + 1, count[i+j])
    }
}


if count[n-1] == 100001 {
    print(-1)
} else {
    print(count[n-1])
}
