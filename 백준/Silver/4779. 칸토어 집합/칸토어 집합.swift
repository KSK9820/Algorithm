import Foundation
var result = ""
while let input = readLine(), let n = Int(input) {
    let length = Int(pow(3.0, Double(n)))
    var arr = Array(repeating: "-", count: length)
    divide(unit: length, s: 0, mid: false)
    
    result += arr.joined() + "\n"
    
    func divide(unit: Int, s: Int, mid: Bool) {
        if mid {
            for i in s..<s+unit {
                arr[i] = " "
            }
            return
        }
        if unit == 0 { return }
        
        divide(unit: unit/3, s: s, mid: false)
        divide(unit: unit/3, s: s + unit/3, mid: true)
        divide(unit: unit/3, s: s + unit/3 * 2, mid: false)
    }
}

result.removeLast()
print(result)