let nc = readLine()!.split(separator: " ").map { Int($0)! }
let (n,c) = (nc[0], nc[1])

var h = [Int](repeating: 0, count: n)
for i in 0..<n {
    h[i] = Int(readLine()!)!
}

h = h.sorted()

var l = 1
var r = h.last! - h.first!

var result = -Int.max
while l <= r {
    let mid = (l+r) / 2 
    
    var temp = h
    var answer = 1
    for j in 1..<n {
        if temp[j] - temp[j-1] >= mid {
            answer += 1
        } else {
            temp[j] = temp[j-1]
        }
    }
    
    if answer >= c {
        l = mid + 1
        result = mid
    } else {
        r = mid - 1
    }
}

print(result)


