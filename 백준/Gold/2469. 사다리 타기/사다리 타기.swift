let k = Int(readLine()!)!
var start = [Int](65..<(65+k)).map { UnicodeScalar($0)! }
let n = Int(readLine()!)!
let order = readLine()!.map { String($0) }
var sadari = Array(repeating: Array(repeating: "", count: k), count: n)
var hidden = 0
for i in 0..<n {
    sadari[i] = readLine()!.map { String($0) }
    if sadari[i].contains("?") { hidden = i }
}

var bef = [Int](0..<k)
for i in 0..<hidden {
    for s in 0..<k {
        if bef[s] == 0 {
            bef[s] += sadari[i][bef[s]] == "-" ? 1 : 0
        } else if bef[s] == k-1 {
            bef[s] -= sadari[i][bef[s]-1] == "-" ? 1 : 0
        } else {
            if sadari[i][bef[s]-1] == "-" {
                bef[s] -= 1
            } else if sadari[i][bef[s]] == "-" {
                bef[s] += 1
            }
        }
    }
}

var aft = order.map { Character($0).asciiValue! - 65 }.enumerated().sorted { $0.element < $1.element }.map { $0.offset }

for i in ((hidden+1)..<n).reversed() {
    for s in 0..<k {
        if aft[s] == 0 {
            aft[s] += sadari[i][aft[s]] == "-" ? 1 : 0
        } else if aft[s] == k-1 {
            aft[s] -= sadari[i][aft[s]-1] == "-" ? 1 : 0
        } else {
            if sadari[i][aft[s]-1] == "-" {
                aft[s] -= 1
            } else if sadari[i][aft[s]] == "-" {
                aft[s] += 1
            }
        }
    }
}

var result = Array(repeating: "*", count: k-1)
for i in 0..<k {
    let dif = bef[i] - aft[i]
    if dif == -1 {
        result[bef[i]] = "-"
    } else if dif == 1 {
        result[aft[i]] = "-"
    } else if abs(dif) > 1 {
        result = Array(repeating: "x", count: k-1)
        break
    }
}

print(result.joined())