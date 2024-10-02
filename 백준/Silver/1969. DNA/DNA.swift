let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var arr = Array(repeating: Array(repeating: "", count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { String($0) }
}
var atgc = Array(repeating: ["A": 0, "T": 0, "G": 0, "C": 0], count: m)

for j in 0..<m {
    for i in 0..<n {
        atgc[j][arr[i][j]]! += 1
    }
}

var result = ""
var hd = 0
for i in atgc {
    let letter = i.max(by: { 
        if $0.value == $1.value {
        return $0.key > $1.key
    }
        return $0.value < $1.value
    })!.key
    result += letter
    hd += i.reduce(0) { $0 + $1.value } - i[letter]!
}
print(result)
print(hd)
