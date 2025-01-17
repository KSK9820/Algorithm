let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m,n) = (mn[0], mn[1])

var woju = [[Int]: Int]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
        .enumerated().sorted {
            $0.element < $1.element
        }
    var order = [Int]()
    for i in 0..<n-1 {
        if input[i+1].element == input[i].element {
            order.append(input[i].offset)
        } else {
            order.append(input[i+1].offset)
        }
    }
    
    woju[order, default: 0] += 1
}
let couple = woju.filter { $0.value > 1 }
var answer = 0
couple.forEach {
    answer += ($0.value * ($0.value - 1)) / 2
}
print(answer)

