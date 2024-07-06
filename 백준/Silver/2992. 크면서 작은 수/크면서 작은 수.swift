let x = Int(readLine()!)!
let arr = Array(String(x)).map { String($0) }
var selected = Array(repeating: "", count: arr.count)
var check = Array(repeating: false, count: arr.count)
var result = Int.max

func backTracking(_ idx: Int) {
    if idx == arr.count {
        let num = Int(selected.joined())!
        if num > x {
            result = min(result, num)
        }
        return
    }
    
    for i in 0..<arr.count {
        if !check[i] {
            check[i] = true
            selected[idx] = arr[i]
            backTracking(idx+1)
            check[i] = false
        }
    }
}

backTracking(0)
print(result == Int.max ? 0 : result)
