
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var result = 0

for i in (0..<n).reversed() {
    var l = 0
    var r = n-1
    
    while l < r {
        if l == i { l += 1; continue }
        if r == i { r -= 1; continue }
        
        if arr[l] + arr[r] < arr[i] {
            l += 1
        } else if arr[l] + arr[r] > arr[i] {
            r -= 1
        } else {
            if l != i && r != i {
                result += 1
                break
            }
        }
    }
}
print(result)
