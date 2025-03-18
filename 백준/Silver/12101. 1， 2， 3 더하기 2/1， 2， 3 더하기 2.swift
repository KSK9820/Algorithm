let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])

var result = [[Int]]()
var count = [Int]()
for i in 1...3 {
    count.append(n/i)
}

func backTracking(left: [Int], sum: Int, now: [Int]) {
    if sum > n { return }
    if sum == n {
        result.append(now)
        return
    }
    
    if left[0] > 0 {
        var new = left
        new[0] -= 1
        backTracking(left: new, sum: sum + 1, now: now + [1])
    }
    if left[1] > 0 {
        var new = left
        new[1] -= 1
        backTracking(left: new, sum: sum + 2, now: now + [2])
    }
    if left[2] > 0 {
        var new = left
        new[2] -= 1
        backTracking(left: new, sum: sum + 3, now: now + [3])
    }
}

backTracking(left: count, sum: 0, now: [])
if result.count >= k {
    print(result[k-1].map { String($0) }.joined(separator: "+"))
} else {
    print(-1)
}

