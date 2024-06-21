let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var money = [Int]()
for _ in 0..<n {
    money.append(Int(readLine()!)!)
}

var left = money.max()!
var right = money.reduce(0, +)

while left <= right {
    let mid = (left + right) / 2
    var k = 1
    var leftMoney = mid
    
    
    for i in money {
        if i <= leftMoney {
            leftMoney -= i
        } else if i > leftMoney {
            k += 1
            leftMoney = mid - i
        }
    }

    if k <= m {
        right = mid - 1
    } else  {
        left = mid + 1
    }
    
}

print(left)

