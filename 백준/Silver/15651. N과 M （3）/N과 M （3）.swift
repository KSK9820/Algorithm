let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var sel = [Int](repeating: 0, count: m)
var result = ""
func nnm(idx: Int) {
    if idx == m {
        result += sel.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 0..<n {
        sel[idx] = i+1
        nnm(idx: idx+1)
    }
}
nnm(idx: 0)
print(result)
