let t = Int(readLine()!)!
var apartment = Array(repeating: Array(repeating: 0, count: 14), count: 15)
apartment[0] = Array(1...14)
for i in 1...14 {
    for j in 0..<14{
        if j == 0 {
            apartment[i][j] = apartment[i-1][j]
        } else {
            apartment[i][j] = apartment[i][j-1] + apartment[i-1][j]
        }
    }
}

var result = ""
for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)! - 1
    result += "\(apartment[k][n])\n"
}
print(result)
