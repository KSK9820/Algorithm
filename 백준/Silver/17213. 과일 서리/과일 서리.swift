let n = Int(readLine()!)!
let m = Int(readLine()!)!

let N = m - 1
let R = min(m-n, n-1)

var result = 1
for i in 0..<R {
    result *= N-i
    result /= i+1
}
print(result)