let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var o = readLine()!.split(separator: " ").map { Int($0)! }
let operation = ["+", "-", "x", "/"]


var selected = [String](repeating: "", count: n-1)
var minResult = Int.max
var maxResult = -Int.max
var opSet = Set<[String]>()

func doCalculate(_ idx: Int) {
    if idx == n-1 {
        opSet.insert(selected)
        return
    }
    
    for i in 0..<4 {
        if o[i] == 0 { continue }
        o[i] -= 1
        selected[idx] = operation[i]
        doCalculate(idx + 1)
        o[i] += 1
    }
}

func calculate(_ op: [String]) {
    var aa = a
    for i in 0..<n-1 {
        aa[i+1] = calculate(a: aa[i], op: op[i], b: aa[i+1])
    }
    minResult = min(aa[n-1], minResult)
    maxResult = max(aa[n-1], maxResult)
}

func calculate(a: Int, op: String, b: Int) -> Int {
    switch op {
    case "+":
        return a + b
    case "-":
        return a - b
    case "x":
        return a * b
    case "/":
        return a / b
    default:
        return 0
    }
}

doCalculate(0)
for i in opSet {
    calculate(i)
}
print(maxResult)
print(minResult)
