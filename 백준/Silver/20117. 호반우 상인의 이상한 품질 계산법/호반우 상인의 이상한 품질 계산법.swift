let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

if n == 1 {
    print(a[0])
} else {
    var result = 0
    if n % 2 == 0 {
        result = a[n/2..<n].reduce(0, +) * 2
    } else {
        result = a[(n/2)+1..<n].reduce(0, +) * 2
        result += a[n/2]
    }
    print(result)
}
