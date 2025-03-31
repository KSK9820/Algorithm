let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }

var result = [a[0]]

for i in 1..<n {
    if result.last! < a[i] {
        result.append(a[i])
        continue
    }
    
    var l = 0
    var r = result.count - 1
    var replace = 0
    while l <= r {
        let m = (l + r) / 2
        if result[m] >= a[i] {
            replace = m
            r = m-1
        } else {
            l = m+1
        }
    }
    result[replace] = a[i]
}
print(result.count)
