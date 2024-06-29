let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var selected = [Int]()
var check = [Bool](repeating: false, count: n)
var result = 0
func makeOrder(_ idx: Int) {
    if idx == n {
        result = max(result, calculate(selected))
        return
    }
    
    for i in 0..<n {
        if !check[i] {
            check[i] = true
            selected.append(arr[i])
            makeOrder(idx + 1)
            selected.popLast()
            check[i] = false
        }
    }
}

func calculate(_ a: [Int]) -> Int {
    var result = 0
    for i in 0..<n-1 {
        result += abs(a[i] - a[i+1])
    }
    return result
}
makeOrder(0)
print(result)