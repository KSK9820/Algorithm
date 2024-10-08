let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var rect = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    rect[i] = readLine()!.map { Int(String($0))! }
}

var maxWidth = min(n,m)
var result = 0

outer: for i in (0..<maxWidth).reversed() {
    for x in 0..<(m-i) {
        for y in 0..<(n-i) {
            let value = [rect[y][x], rect[y][x+i], rect[y+i][x], rect[y+i][x+i]]
            if value.min() == value.max() {
                result = (i+1) * (i+1)
                break outer
            }
        }
    }
}

print(result)