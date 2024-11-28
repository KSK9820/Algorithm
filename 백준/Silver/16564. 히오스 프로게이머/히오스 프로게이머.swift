let nk = readLine()!.split(separator: " ").map{ Int($0)! }
var (n, k) = (nk[0], nk[1])
var x = [Int](repeating: 0, count: n)

for i in 0..<n {
    x[i] = Int(readLine()!)!
}

var left = x.min()!
var right = x.max()! + k

while left <= right {
    let mid = (left + right) / 2
    var level = 0
    x.forEach {
        level += mid - $0 > 0 ? mid - $0 : 0
    }
    
    if level <= k {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
print(right)