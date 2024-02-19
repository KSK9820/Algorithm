let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = 1000000000
var result = [Int]()
var zero = false

while left<=right {

    if arr.count == 1 || Set(arr).count == 1 {
        zero = true
        break
    }
    
    let mid = (left+right)/2
    var tired = [Bool](repeating: false, count: n)
    for i in 0..<n-1 {
        if abs(arr[i]-arr[i+1]) > mid {
            tired[i] = true
            tired[i+1] = true
        }
    }
    
    if tired.filter({ $0 == true }).count <= k {
        right = mid - 1
    } else {
        left = mid + 1
    }
    
}
zero ? print(0) : print(left)