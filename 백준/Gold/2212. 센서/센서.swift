let n = Int(readLine()!)!
let k = Int(readLine()!)!
let s = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
if n <= k {
    print(0)
} else {
    var dif = [Int]()
    for i in 0..<n-1 {
        dif.append(abs(s[i+1] - s[i]))
    }
    dif.sort(by: >)

    var result = s[n-1] - s[0]

    for i in 0..<k-1 {
        result -= dif[i]
    }
    print(result)
}
