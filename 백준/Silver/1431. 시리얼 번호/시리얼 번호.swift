let n = Int(readLine()!)!
var serial = [(String, Int)](repeating: ("",0), count: n)
for i in 0..<n {
    let num = readLine()!.map { String($0) }
    serial[i] = (num.joined(), num.filter { $0.lowercased() == $0 }.map { Int(String($0))! }.reduce(0, +))
}

serial = serial.sorted { $0.0 < $1.0 }.sorted { $0.1 < $1.1 }.sorted { $0.0.count < $1.0.count }

for s in serial {
    print(s.0)
}