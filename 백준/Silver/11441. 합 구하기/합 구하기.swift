let n = Int(readLine()!)!
var a = [0]
a += readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

for i in 1...n {
   a[i] += a[i-1]
}
var result = ""
for i in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (ij[0], ij[1])
    result += "\(String(a[j]-a[i-1]))\n"
}
print(result)