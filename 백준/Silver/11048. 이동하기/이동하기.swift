
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = Array(repeating: Array(repeating: (0,0), count: m), count: n)
let mx = [1, 0, 1]
let my = [0, 1, 1]

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { (Int($0)!, Int($0)!) }
}

for y in 0..<n {
    for x in 0..<m {
        if y == n-1 && x == m-1 {
            print(arr[n-1][m-1].1)
            break
        }
        if y == n-1 {
            arr[y][x+1].1 = max(arr[y][x+1].1, arr[y][x+1].0 + arr[y][x].1)
        }
        if x == m-1 {
            arr[y+1][x].1 = max(arr[y+1][x].1, arr[y+1][x].0 + arr[y][x].1)
        }
        if x < m-1 && y < n-1 {
            arr[y][x+1].1 = max(arr[y][x+1].1, arr[y][x+1].0 + arr[y][x].1)
            arr[y+1][x].1 = max(arr[y+1][x].1, arr[y+1][x].0 + arr[y][x].1)
            arr[y+1][x+1].1 = arr[y][x].1 + max(arr[y+1][x].0, arr[y][x+1].0)
        }
    }
}