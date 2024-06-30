let ns = readLine()!.split(separator: " ").map { Int($0)! }
let (n,s) = (ns[0], ns[1])

var arr = readLine()!.split(separator: " ").map { Int($0)! }
var selected = [Int]()
var check = Array(repeating: false, count: n)
var list = [[Int]]()
func makePart(_ idx: Int) {
    if selected.reduce(0, +) == s && !selected.isEmpty {
        list.append(selected)
    }
    
    for i in idx..<n {
        if !check[i] {
            check[i] = true
            selected.append(arr[i])
            makePart(i+1)
            selected.removeLast()
            check[i] = false
        }
    }
}
makePart(0)

var result = 0
for i in list {
    if i.reduce(0, +) == s { result += 1}
}
print(result)
