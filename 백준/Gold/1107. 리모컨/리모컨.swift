let n = Int(readLine()!)!
let m = Int(readLine()!)!
var broken = [String]()
if m != 0 {
    broken = readLine()!.split(separator: " ").map { String($0) }
}
var result = abs(n-100)
if n == 100 {
    print(0)
} else {
    for i in 0...1000000 {
        if canPressNumber(i) {
            result = min(result, pressCount(i))
        }
    }
    print(result)
}

func canPressNumber(_ num: Int) -> Bool {
    for i in String(num).map({ String($0) }) {
        if broken.contains(i) { return false }
    }
    
    return true
}

func pressCount(_ num: Int) -> Int {
    return String(num).count + abs(n-num)
}
