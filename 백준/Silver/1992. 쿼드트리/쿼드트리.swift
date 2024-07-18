let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { Int(String($0))! }
}
var result = ""

func divide(_ unit: Int, _ w: Int, _ h: Int) {
    
    if square(unit, w, h) {
        result.append("\(arr[w][h])")
        return
    }
    
    result += "("
    divide(unit/2, w, h)
    divide(unit/2, w, h+unit/2)
    divide(unit/2, w+unit/2, h)
    divide(unit/2, w+unit/2, h+unit/2)
    result += ")"
    
}


func square(_ unit: Int, _ w: Int, _ h: Int) -> Bool {
    
    for i in w..<unit+w {
        for j in h..<unit+h {
            if arr[i][j] != arr[w][h] {
                return false
            }
        }
    }
    return true
}

divide(n, 0, 0)
print(result)


