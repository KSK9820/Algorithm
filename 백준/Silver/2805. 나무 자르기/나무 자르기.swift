
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
let tree = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = tree.max()!

while left <= right {
    let mid = (left + right) / 2
    
    var value = 0
    for i in tree where i > mid {
        value += i - mid
    }
    
    if value < m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(right)
