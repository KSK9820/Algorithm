let cr = readLine()!.split(separator: " ").map { Int($0)! }
let (c,r) = (cr[0], cr[1])
let k = Int(readLine()!)!

if k == 1 {
    print("\(1) \(1)")
} else if c * r < k {
    print(0)
} else {
    var arr = Array(repeating: Array(repeating: 0, count: r+2), count: c+2)
    for i in 0...r+1 {
        arr[0][i] = 1
        arr[c+1][i] = 1
    }
    for i in 0...c+1 {
        arr[i][0] = 1
        arr[i][r+1] = 1
    }
    
    let mx = [0,-1,0,1]
    let my = [1,0,-1,0]
    
    var result = 1
    var rx = 1
    var ry = 1
    var idx = 0
    
    arr[rx][ry] = 1
    
    while result < k {
        let nx = rx + mx[idx]
        let ny = ry + my[idx]
        
        if arr[nx][ny] == 1 {
            idx = (idx + 1) % 4
        } else {
            rx = nx
            ry = ny
            arr[rx][ry] = 1
            result += 1
        }
        if result == k {
            print(rx, ry)
            break
        }
    }
}