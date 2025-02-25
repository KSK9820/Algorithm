let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! } + [Int.max]

var result = [Int](repeating: 1, count: n+1)
for i in 1..<n {
    for j in 0..<i {
        if array[j] > array[i] {
            result[i] = max(result[i], result[j] + 1)
        }
    }
}
print(n - result.max()!)
