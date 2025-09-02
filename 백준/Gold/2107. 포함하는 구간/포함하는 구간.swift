
let n = Int(readLine()!)!
var arr: [(s: Int, e: Int)] = []

for _ in 0..<n {
    let se = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((se[0], se[1]))
}

arr = arr.sorted {
    if $0.s == $1.s {
        return $0.e > $1.e
    }
    return $0.s < $1.s
}

var result = [(s: Int, e: Int, c: Int)]()

for i in arr {
    if result.isEmpty {
        result.append((i.s, i.e, 0))
    } else {
        var flag = true
        for j in 0..<result.count {
            if result[j].s <= i.s && result[j].e >= i.e {
                result[j].c += 1
                flag = false
            }
        }
        if flag {
            result.append((i.s, i.e, 0))
        }
    }
}

print(result.map { $0.c }.max()!)

