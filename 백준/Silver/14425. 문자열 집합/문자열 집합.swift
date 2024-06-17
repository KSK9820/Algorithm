let nm = readLine()!.split(separator: " ").map { Int($0)! }
var a = Set<String>()

for i in 0..<nm[0] {
    a.insert(readLine()!)
}
var count = 0
for i in 0..<nm[1] {
    if a.contains(readLine()!) {
        count += 1
    }
}
print(count)
