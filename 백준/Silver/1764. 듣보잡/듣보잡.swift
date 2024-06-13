let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var nolisten = Set<String>()
var nosee = Set<String>()
for i in 0..<n {
    nolisten.insert(readLine()!)
}
for i in 0..<m {
    nosee.insert(readLine()!)
}

let noUnioin = nolisten.intersection(nosee)
print(noUnioin.count)
print(noUnioin.sorted().joined(separator: "\n"))