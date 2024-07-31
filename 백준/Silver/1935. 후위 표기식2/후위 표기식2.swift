import Foundation
let n = Int(readLine()!)!
var arr = readLine()!.map { String($0) }
var number = [Int]()
for i in 0..<n {
    number.append(Int(readLine()!)!)
}
let op = ["+", "-", "/", "*"]

var stack = [Double]()
var index = 0
while index < arr.count {
    let now = arr[index]
    if op.contains(now) {
        guard let num1 = stack.popLast() else { break }
        guard let num2 = stack.popLast() else { break }
        stack.append(calculate(num2, num1, now))
    } else {
        stack.append(Double(number[Int((Character(now).asciiValue!)) - 65]))
    }
    index += 1
}

print(String(format: "%.2f", stack[0]))

func calculate(_ num1: Double, _ num2: Double, _ op: String) -> Double {
    switch op {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    case "/":
        return num1 / num2
    default:
        break
    }
    return 0
}