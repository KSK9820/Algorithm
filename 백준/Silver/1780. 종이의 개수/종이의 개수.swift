let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var minus1 = 0
var zero = 0
var plus1 = 0

func divide(_ unit: Int, _ w: Int, _ h: Int) {
    let result = check(unit: unit, w: w, h: h)
    if result.0 {
        if result.1 == -1 {
            minus1 += 1
        } else if result.1 == 0 {
            zero += 1
        } else {
            plus1 += 1
        }
        return
    }
    
    divide(unit/3, w, h)
    divide(unit/3, w+unit/3, h)
    divide(unit/3, w+(unit/3 * 2), h)
    divide(unit/3, w, h + unit/3)
    divide(unit/3, w+unit/3, h+unit/3)
    divide(unit/3, w+(unit/3 * 2), h+unit/3)
    divide(unit/3, w, h+(unit/3*2))
    divide(unit/3, w+unit/3, h+(unit/3*2))
    divide(unit/3, w+(unit/3 * 2), h+(unit/3*2))
    
}

func check(unit: Int, w: Int, h: Int) -> (Bool, Int) {
    for x in 0..<unit {
        for y in 0..<unit {
            if arr[w][h] != arr[w+x][h+y] {
                return (false, -2)
            }
        }
    }
    return (true, arr[w][h])
}

divide(n, 0, 0)
print(minus1)
print(zero)
print(plus1)