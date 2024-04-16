let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { Int(String($0))! }
}

for y in 1..<n {
    for x in 1..<m {
        if arr[y][x] == 1 {
            arr[y][x] = min(arr[y-1][x-1], arr[y-1][x], arr[y][x-1]) + 1            
        }
    }
}
var result = arr.flatMap { $0 }.max()!
print(result * result)
