let x = Int(readLine()!)!
var m = [64]

while m.reduce(0, +) != x {
    guard var last = m.popLast() else { break }
    if m.reduce(0, +) + last / 2 > x { m.append(last / 2) }
    else {
        m.append(last/2)
        m.append(last/2)
    }
}
print(m.filter{ $0 !=  0 }.count)