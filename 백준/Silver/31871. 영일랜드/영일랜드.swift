let n = Int(readLine()!)!
let m = Int(readLine()!)!

var arr = Array(repeating: [(d: Int, w: Int)](), count: n+1)
var input = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for _ in 0..<m {
    let uvd = readLine()!.split(separator: " ").map { Int($0)! }
    if input[uvd[0]][uvd[1]] < uvd[2] {
        input[uvd[0]][uvd[1]] = uvd[2]
    }
}
for i in 0...n {
    for j in 0...n {
        if input[i][j] > 0 {
            arr[i].append((j, input[i][j]))
        }
    }
}


var sel = [Int]()
var check = [Bool](repeating: false, count: n+1)
var result = -1
func backTracking(_ idx: Int) {
    if sel.count == n+1 {
        result = max(result, sel.reduce(0, +))
        return
    }
    
    for i in 0..<arr[idx].count {
        if check[arr[idx][i].d] { continue }
        if arr[idx][i].d == idx { continue }
        if sel.count != n && arr[idx][i].d == 0 { continue }
        
        check[arr[idx][i].d] = true
        sel.append(arr[idx][i].w)
        backTracking(arr[idx][i].d)
        sel.removeLast()
        check[arr[idx][i].d] = false
    }
}

backTracking(0)
print(result)
