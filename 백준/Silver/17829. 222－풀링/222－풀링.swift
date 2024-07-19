var n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}


while true {
    var array = Array(repeating: Array(repeating: 0, count: n/2), count: n/2)
    divide(n, y: 0, x: 0, &array)
    n = n/2
    arr = array
    if n == 1 {
        print(array[0][0])
        break
    }
}



func divide(_ unit: Int, y: Int, x: Int, _ array: inout [[Int]]) {
    
    if unit == 2 {
        array[y/2][x/2] = findSecond(y: y, x: x, &arr)
        return
    }
    
    divide(unit/2, y: y, x: x, &array)
    divide(unit/2, y: y, x: x+unit/2, &array)
    divide(unit/2, y: y+unit/2, x: x, &array)
    divide(unit/2, y: y+unit/2, x: x+unit/2, &array)
    
}

func findSecond(y: Int, x: Int, _ arr: inout [[Int]]) -> Int {
    let arr = [arr[y][x], arr[y+1][x], arr[y][x+1], arr[y+1][x+1]].sorted(by: <)
    return arr[2]
}


