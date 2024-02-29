let xy = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y) = (xy[0], xy[1])
let z = y * 100 / x
if z >= 99 {
    print(-1)
} else {
    var left = 0
    var right = x
    
    while (left+1) < right {
        let mid = (left + right) / 2
        if z < (y+mid) * 100 / (x + mid) {
            right = mid
        } else {
            left = mid
        }
    }
    print(right)
}