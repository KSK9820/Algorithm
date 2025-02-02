let n = Int(readLine()!)!
let home = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
print(home[(n-1)/2])