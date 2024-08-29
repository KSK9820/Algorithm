let nx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (nx[0], nx[1])
let v = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0
var visited = 0
var day = 1
for i in 0..<x {
    result += v[i]
    visited += v[i]
}

for i in x..<n {
    visited = visited + v[i] - v[i-x]
    if result == visited {
        day += 1
    } else if result < visited {
        day = 1
    }
    result = max(result, visited)
}

if result == 0 {
    print("SAD")
} else {
    print(result)
    print(day)
}