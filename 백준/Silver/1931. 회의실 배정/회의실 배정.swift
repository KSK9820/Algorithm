let n = Int(readLine()!)!
var h = [(s: Int, e: Int)](repeating: (0,0), count: n)


for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    h[i] = (input[0], input[1])
}

h = h.sorted { $0.s < $1.s }.sorted { $0.e < $1.e }
var second = n
var index = 0
var result = 0

var tmp = [(s: Int, e: Int)]()
tmp.append(h[0])
for i in (index+1)..<n {
    if tmp.last!.e <= h[i].s {
        if tmp.count == 1 { second = i }
        tmp.append(h[i])
    }
}
result = max(result, tmp.count)
index += 1
print(result)