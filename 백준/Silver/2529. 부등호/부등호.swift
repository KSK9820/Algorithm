
let k = Int(readLine()!)!
let sign = readLine()!.split(separator: " ").map { String($0) }

var selected = Array(repeating: 0, count: k+1)
var check = Array(repeating: false, count: 10)
var minValue = String(Int.max)
var maxValue = String(Int.min)
func backTracking(_ index: Int) {
    if index > 1 {
        if !compare(n1: selected[index-2], n2: selected[index-1], compare: sign[index-2]) {
            return
        }
    }
    
    if index == k+1 {
        let result = selected.map { String($0) }.joined()
        
        minValue = min(minValue, result)
        maxValue = max(maxValue, result)
        return
    }
    
    for i in 0...9 {
        if !check[i] {
            check[i] = true
            selected[index] = i
            backTracking(index+1)
            check[i] = false
        }
    }
}

func compare(n1: Int, n2: Int, compare: String) -> Bool {
    if compare == "<" && n1 < n2 { return true }
    if compare == ">" && n1 > n2 { return true }
    return false
}

backTracking(0)
print(maxValue)
print(minValue)
