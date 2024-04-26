var s = Array(readLine()!.map { String($0) })
var prefix = [s.joined()]
for i in 0..<s.count-1 {
    s.removeFirst()
    prefix.append(s.map { String($0) }.joined())
}
print(prefix.sorted(by: <).joined(separator: "\n"))
