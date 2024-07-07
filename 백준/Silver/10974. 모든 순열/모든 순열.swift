let n = Int(readLine()!)!
var arr = Array(1...n)
var selected = Array(repeating: "", count: n)
var check = Array(repeating: false, count: n)

func backTracking(_ idx: Int) {
    if idx == n {
        print(selected.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if !check[i] {
            check[i] = true
            selected[idx] = "\(arr[i])"
            backTracking(idx + 1)
            check[i] = false
        }
    }
}
backTracking(0)
