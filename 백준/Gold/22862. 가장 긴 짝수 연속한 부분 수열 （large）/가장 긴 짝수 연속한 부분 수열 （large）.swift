let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
let s = readLine()!.split(separator: " ").map { Int($0)! }

var (left, right) = (0,0)
var result = 0
var odd = 0

while left < n && right < n {
    if odd > k {
        if s[left] % 2 == 1 {
            odd -= 1
        }
        left += 1
    } else {
        if s[right] % 2 == 1 {
            odd += 1
        }
        right += 1
    }
    
    result = max(result, right - left - odd)
}
print(result)