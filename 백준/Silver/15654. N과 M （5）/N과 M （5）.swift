let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var check = [Bool](repeating: false, count: n)
var sel = [Int](repeating: 0, count: m)
var result = ""

func nnm(idx: Int) {
    if idx == m {
        result += sel.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 0..<n {
        if !check[i] {
            check[i] = true
            sel[idx] = numbers[i]
            nnm(idx: idx+1)
            check[i] = false
        }
    }
}
nnm(idx: 0)
print(result)


