import Foundation

let c = Int(readLine()!)!
let s = Int(pow(10.0, Float(c-1)))
let e = Int(pow(10.0, Float(c)))

var already = [Int: Bool]()
var result = [Int]()

func find(n: Int) -> Bool {
    if n <= 1 { return false }
    if n == 2 { return true }
    if n % 2 == 0 { return false }
    for i in stride(from: 3, through: sqrt(Double(n)), by: 2) {
        if n % Int(i) == 0 {
            already[n] = false
            return false
        }
    }
    already[n] = true
    return true
}

var sel = [Int]()
var firstNum = [Int]()
func firstCheck(idx: Int) {
    if idx == c {
        firstNum.append(Int(sel.map { String($0) }.joined())!)
        return
    }
    
    if idx == 0 {
        for i in [2,3,5,7] {
            sel.append(i)
            firstCheck(idx: idx+1)
            sel.popLast()
        }
    } else {
        for i in [1,3,5,7,9] {
            sel.append(i)
            if find(n: Int(sel.map { String($0) }.joined())!) == false {
                sel.popLast()
                continue
            }
            firstCheck(idx: idx + 1)
            sel.popLast()
        }
    }
}

firstCheck(idx: 0)
print(firstNum.map { String($0) }.joined(separator: "\n"))
