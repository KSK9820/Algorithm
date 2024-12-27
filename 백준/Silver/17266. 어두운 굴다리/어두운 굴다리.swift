
let n = Int(readLine()!)!
let m = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }

var dif = [Int]()
dif.append(x[0])
for i in 0..<m-1 {
    dif.append(((x[i+1] - x[i])+1) / 2)
}
dif.append(n-x[m-1])
print(dif.max()!)
