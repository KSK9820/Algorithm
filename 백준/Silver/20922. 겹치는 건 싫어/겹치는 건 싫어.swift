let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = 0

var result = 0
var c = Array(repeating: 0, count: 100001)

while left < n && right < n {
    if c[arr[right]] < k {
        c[arr[right]] += 1
        right += 1
    } else {
        c[arr[left]] -= 1
        left += 1
    }
    
    result = max(result, abs(right - left))
}

print(result)
