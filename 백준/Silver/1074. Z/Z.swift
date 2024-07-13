import Foundation

let nrc = readLine()!.split(separator: " ").map { Int($0)! }
let (n,r,c) = (nrc[0], nrc[1], nrc[2])

let k = Int(pow(2.0, Double(n)))
var arr = Array(repeating: Array(repeating: 0, count: k), count: k)

var result = 0
func divide(unit: Int, ur: Int, uc: Int) {
    if ur == r && uc == c {
        print(result)
        return
    }
    
    //범위: ur ~ ur + unit, uc ~ uc + unit
    if !(ur <= r && r < ur + unit && uc <= c && c < uc + unit) {
        result += unit * unit
        return
    }
    
    divide(unit: unit / 2, ur: ur, uc: uc)
    divide(unit: unit / 2, ur: ur, uc: uc + unit / 2)
    divide(unit: unit / 2, ur: ur + unit / 2, uc: uc)
    divide(unit: unit / 2, ur: ur + unit / 2, uc: uc + unit / 2)
}

divide(unit: k, ur: 0, uc: 0)