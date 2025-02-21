import Foundation

var q = [(Int, Int)]()
for i in 1...8 {
    q.append((Int(readLine()!)!, i))
}
q = q.sorted { $0.0 > $1.0 }[0..<5].sorted { $0.1 < $1.1 }


print(q.map { $0.0 }.reduce(0, +))
print(q.map { String($0.1) }.joined(separator: " "))
