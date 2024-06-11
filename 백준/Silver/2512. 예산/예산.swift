
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

if arr.reduce(0, +) <= m {
    print(arr.max()!)
} else {
    var left = 0
    var right = arr.max()!

    while left <= right {
        let mid = (left + right) / 2
        var total = 0
        for i in arr {
            if i <= mid {
                total += i
            } else {
                total += mid
            }
        }
        if total > m {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    print(right)
}