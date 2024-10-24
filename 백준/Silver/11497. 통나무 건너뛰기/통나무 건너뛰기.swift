var t = Int(readLine()!)!
var result = ""
while t > 0 {
    let n = Int(readLine()!)!
    let l = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var arr = [Int](repeating: 0, count: n)
    var lidx = 0
    var ridx = n-1
    for i in 0..<(n / 2) {
        arr[lidx] = l[i*2]
        arr[ridx] = l[i*2+1]
        lidx += 1
        ridx -= 1
    }
    if n % 2 != 0 {
        arr[lidx] = l[n-1]
    }
    
    var temp = arr.last! - arr.first!
    for i in 0..<arr.count-1 {
        temp = max(temp, abs(arr[i] - arr[i+1]))
    }
    result += "\(temp)\n"
    t -= 1
    
}
print(result)