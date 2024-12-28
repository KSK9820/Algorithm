let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = arr.max()!
var right = 10000 * m
var result = Int.max
if m == n {
    print(arr.max()!)
} else if m == 1 {
    print(arr.reduce(0, +))
} else {
    while left <= right {
        let mid = (left + right) / 2
        var video = 1
        var minute = 0
        
        for i in 0..<n {
            if minute + arr[i] > mid {
                video += 1
                minute = arr[i]
                
                if video > m {
                    break
                }
            } else {
                minute += arr[i]
            }
        }
        
        if video <= m {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    print(left)
}
