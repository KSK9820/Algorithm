let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
let l = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var left = 1
var right = l.max()!
var result = 0
while left <= right {
    let mid = (left + right) / 2
    let count = l.filter { $0 >= mid }.map { $0 / mid }.reduce(0, +)

    if count >= m {
        result = max(result, mid)
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)