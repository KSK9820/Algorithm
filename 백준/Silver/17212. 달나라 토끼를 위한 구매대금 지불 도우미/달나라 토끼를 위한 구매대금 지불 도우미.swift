let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: 8+n)

let coins = [1,2,5,7]
for coin in coins {
    arr[coin] = 1
}
arr[3] = 2
arr[4] = 2
arr[6] = 2

if n >= 8 {
    for i in 8..<n+1 {
        arr[i] = min(arr[i-1]+1, arr[i-2]+1, arr[i-5]+1, arr[i-7]+1)
    }
}

print(arr[n])
