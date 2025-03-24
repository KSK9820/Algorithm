let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var left = arr
var right = arr

for i in 1..<n {
    right[i] += right[i-1]
    left[n-1-i] += left[n-i]
}

var result = -Int.max
for i in 1..<n-1 {
    let bbh = (left[0] - arr[0] - arr[i]) + (left[i] - arr[i])
    let hbb = (right[n-1] - arr[n-1] - arr[i]) + (right[i] - arr[i])
    let bhb = (right[i] - arr[0]) + (left[i] - arr[n-1])
    
    result = max(bbh, hbb, bhb, result)
}

print(result)

