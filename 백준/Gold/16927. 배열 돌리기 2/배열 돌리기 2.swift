
let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,r) = (nmr[0], nmr[1], nmr[2])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = row
}


func rotate(_ idx: Int) {
    let height = n - idx * 2
    let width = m - idx * 2
    if height <= 1 || width <= 1 { return }
    
    let c = height * 2 + width * 2 - 4
    let mod = r % c
    var layer = [Int]()
    
    if  mod == 0 { rotate(idx + 1); return }
    
    for y in idx..<(n-idx-1) {
        layer.append(arr[y][idx])
    }
    for x in idx..<(m-idx-1) {
        layer.append(arr[n-idx-1][x])
    }
    for y in stride(from: n-idx-1, to: idx, by: -1) {
        layer.append(arr[y][m-idx-1])
    }
    for x in stride(from: m-idx-1, to: idx, by: -1) {
        layer.append(arr[idx][x])
    }
    
    layer = Array(layer[c-mod..<c]) + Array(layer[0..<c-mod])
    
    var i = 0
    for y in idx..<(n-idx-1) {
        arr[y][idx] = layer[i]
        i += 1
    }
    for x in idx..<(m-idx-1) {
        arr[n-idx-1][x] = layer[i]
        i += 1
    }
    for y in stride(from: n-idx-1, to: idx, by: -1) {
        arr[y][m-idx-1] = layer[i]
        i += 1
    }
    for x in stride(from: m-idx-1, to: idx, by: -1) {
        arr[idx][x] = layer[i]
        i += 1
    }
    
    rotate(idx+1)
}

rotate(0)
arr.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}
