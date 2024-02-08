let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var sel = [Int]()
var check = [Bool](repeating: false, count: n)

func nnm(depth: Int) {
    if depth == m {
        print(sel.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 0..<n {
        if !check[i] {
            check[i] = true
            sel.append(i+1)
            nnm(depth: depth + 1)
            check[i] = false
            sel.popLast()
        }
    }
    
}
nnm(depth: 0)