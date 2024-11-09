let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr = arr.sorted()


var left = 0
var right = 0
var result = Int.max

while left < n && right < n {
    let dif = arr[right] - arr[left]
    if dif == m {
        result = m
        break
    }
    
    if dif < m {
        right += 1
    } else {
        result = min(result, dif)
        left += 1
    }
}
print(result)