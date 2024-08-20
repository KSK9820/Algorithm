let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
var medal = [(n: Int, g: Int, e: Int, d: Int)]()
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    medal.append((input[0], input[1], input[2], input[3]))
}
medal = medal.sorted { $0.d > $1.d }.sorted { $0.e > $1.e }.sorted { $0.g > $1.g }


var result = [Int](repeating: 1, count: n+1)
var count = 1
for i in 1..<n {
    if medal[i].g < medal[i-1].g {
        result[medal[i].n] = result[medal[i-1].n] + count
        count = 1
    } else if medal[i].e < medal[i-1].e {
        result[medal[i].n] = result[medal[i-1].n] + count
        count = 1
    } else if medal[i].d < medal[i-1].d {
        result[medal[i].n] = result[medal[i-1].n] + count
        count = 1
    } else {
        result[medal[i].n] = result[medal[i-1].n]
        count += 1
    }
}
print(result[k])