let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var result = 0
if n == 1 {
    result = 1
} else if n == 2 {
    result = min(3, (m-1) / 2) + 1
} else if m < 7 {
    result = min(3, m-1) + 1
} else {
    result = 5 + (m-7)
}

print(result)
