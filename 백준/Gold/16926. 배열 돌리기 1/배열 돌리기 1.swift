let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,r) = (nmr[0], nmr[1], nmr[2])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = row
}
var result = Array(repeating: Array(repeating: 0, count: m), count: n)

func rotate(_ idx: Int) {
    let height = n - idx * 2
    let width = m - idx * 2
    if height <= 1 || width <= 1 { return }
    
    let count = (n - idx * 2) * 2 + (m - idx * 2) * 2 - 4
    
    
    let mod = r % count
    
    // 반시계 방향 layer
    var layer = [Int]()
    for y in idx..<n - idx - 1 {
        layer.append(arr[y][idx])
    }
    for x in idx..<m - idx - 1 {
        layer.append(arr[n-idx-1][x])
    }
    for y in (idx..<n - idx).reversed() {
        layer.append(arr[y][m-idx-1])
    }
    for x in (idx+1..<(m-idx-1)).reversed() {
        layer.append(arr[idx][x])
    }
    
    let rotated = Array(layer[(count-mod)..<count] + layer[0..<count-mod])
    var r = 0
    for y in idx..<n - idx - 1 {
        arr[y][idx] = rotated[r]
        r += 1
    }
    for x in idx..<m - idx - 1 {
        arr[n-idx-1][x] = rotated[r]
        r += 1
    }
    for y in (idx..<n - idx).reversed() {
        arr[y][m-idx-1] = rotated[r]
        r += 1
    }
    for x in (idx+1..<(m-idx-1)).reversed() {
        arr[idx][x] = rotated[r]
        r += 1
    }
    
    rotate(idx+1)
}

rotate(0)

for i in 0..<n {
    print(arr[i].map { String($0) }.joined(separator: " "))
}
        
