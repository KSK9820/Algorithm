let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

let ballon = readLine()!.split(separator: " ").map { Int($0)! }

var min = 1
var max = ballon.min()! * m
while min <= max {
    let mid = (min + max) / 2
    var ballons = ballon.map { mid / $0 }.reduce(0, +)

    if ballons >= m {
        max = mid - 1
    } else {
        min = mid + 1
    }
    
}
print(min)