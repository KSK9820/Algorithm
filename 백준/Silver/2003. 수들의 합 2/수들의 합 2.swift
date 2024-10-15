let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
for i in 1..<arr.count {
    arr[i] += arr[i-1]
}

var result = 0
for i in 1..<arr.count {
    for j in 0..<i {
        if arr[i] - arr[j] == m {
            result += 1
        }
    }
}

print(result)