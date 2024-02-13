let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map { String($0) }

var sel = [String](repeating: "", count: m)
var result = [String:Int]()
func nnm(idx: Int) {
    if idx == m {
        if result[sel.joined(separator: " ")] == nil {
            result[sel.joined(separator: " ")] = result.count
        }
        return
    }
    for i in 0..<n {
        sel[idx] = numbers[i]
        nnm(idx: idx+1)
    }
}
nnm(idx: 0)
print(result.sorted { $0.value < $1.value }.map { $0.key }.joined(separator: "\n"))

