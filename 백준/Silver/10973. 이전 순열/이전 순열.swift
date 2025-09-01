let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var i = n-1
while i > 0 && arr[i-1] <= arr[i] {
    i -= 1
}

if i == 0 { print(-1) }
else {
    var j = n-1
    while arr[j] >= arr[i-1] {
        j -= 1
    }
    arr.swapAt(i-1, j)
    arr = arr[0..<i] + Array(arr[i...]).reversed()
    print(arr.map { String($0) }.joined(separator: " "))
}
