let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var white = 0
var blue = 0
func divide(_ unit: Int, _ w: Int, _ h: Int) {
    let result = check(unit: unit, w: w, h: h)
    if result.0 {
        if result.1 == 0 {
            white += 1
        } else {
            blue += 1
        }
        return
    }
    
    divide(unit/2, w, h)
    divide(unit/2, w+unit/2, h)
    divide(unit/2, w, h+unit/2)
    divide(unit/2, w+unit/2, h+unit/2)
}

func check(unit: Int, w: Int, h: Int) -> (Bool, Int) {
    for x in 0..<unit {
        for y in 0..<unit {
            if arr[w][h] != arr[w+x][h+y] {
                return (false, -1)
            }
        }
    }
    return (true, arr[w][h])
}

divide(n, 0, 0)
print(white)
print(blue)
