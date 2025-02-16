var n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func divide(unit: Int, y: Int, x: Int) {
    if unit == 2 {
        arr[y / 2][x / 2] = findSecond(y: y, x: x)
        return
    }

    let half = unit / 2
    
    divide(unit: half, y: y, x: x)
    divide(unit: half, y: y, x: x + half)
    divide(unit: half, y: y + half, x: x)
    divide(unit: half, y: y + half, x: x + half)
}

func findSecond(y: Int, x: Int) -> Int {
    let values = [arr[y][x], arr[y + 1][x], arr[y][x + 1], arr[y + 1][x + 1]].sorted()
    return values[1]
}

while n > 1 {
    divide(unit: n, y: 0, x: 0)
    n /= 2
}

print(arr[0][0])