let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var num = [0] + readLine()!.split(separator: " ").map { Int($0)! }
for i in 1...n {
    num[i] += num[i-1]
}

var result = ""
for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let (i,j) = (ij[0], ij[1])
    
    result += "\(num[j] - num[i-1])\n"
}
print(result)