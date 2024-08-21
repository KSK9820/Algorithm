let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: "", count: n), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { String($0) }
}

var hor = 0
var ver = 0

for i in 0..<n {
    var flag = 0
    for j in 0..<n {
        if arr[i][j] == "." {
            flag += 1
        } else {
            if flag >= 2 {
                hor += 1
            }
            flag = 0
        }
    }
    if flag >= 2 { hor += 1}
}
for j in 0..<n {
    var flag = 0
    var keep = true
    for i in 0..<n {
        if arr[i][j] == "." {
            flag += 1
        } else {
            if flag >= 2 {
                ver += 1
            }
            flag = 0
        }
    }
    if flag >= 2 { ver += 1}
}
print("\(hor) \(ver)")