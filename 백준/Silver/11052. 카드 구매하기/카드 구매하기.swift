let n = Int(readLine()!)!
let p = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var result = p
result[1] = p[1]
for i in 2...n {
    for j in 1...i/2 {
        result[i] = max(result[i], result[i-j] + result[j])
    }
}
print(result[n])
