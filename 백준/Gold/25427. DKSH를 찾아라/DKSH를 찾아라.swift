let n = Int(readLine()!)!
let arr = Array(readLine()!)

var d = 0
var dk = 0
var dks = 0
var dksh = 0
for i in 0..<n {
    switch arr[i] {
    case "D":
        d += 1
    case "K":
        dk += d
    case "S":
        dks += dk
    case "H":
        dksh += dks
    default:
        continue
    }
}

print(dksh)
