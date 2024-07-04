let n = Int(readLine()!)!
let k = Int(readLine()!)!
var card = [Int]()
var result = Set<Int>()
for _ in 0..<n {
    card.append(Int(readLine()!)!)
}

var selected = [Int]()
var check = Array(repeating: false, count: n)
func pick(_ idx: Int) {
    if idx == k {
        var temp = selected.map { String($0) }.joined(separator: "")
        result.insert(Int(temp)!)
        return
    }
    
    for i in 0..<n {
        if !check[i] {
            check[i] = true
            selected.append(card[i])
            pick(idx+1)
            selected.popLast()
            check[i] = false
        }
    }
}

pick(0)
print(result.count)
