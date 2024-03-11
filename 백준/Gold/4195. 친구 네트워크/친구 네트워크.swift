let t = Int(readLine()!)!
var result = [Int]()
for _ in 0..<t {
    let f = Int(readLine()!)!
    var friend = [String: String]()
    var count = [String: Int]()

    
    for _ in 0..<f {
        let names = readLine()!.split(separator: " ").map { String($0) }
        
        for name in names {
            if friend[name] == nil {
                friend[name] = name
                count[name] = 1
            }
        }
        
        result.append(union(names[0], names[1]))
    }
    
    func union(_ a: String, _ b: String) -> Int {
        let aP = find(a)
        let bP = find(b)
        
        if aP != bP {
            friend[bP] = aP
            count[aP]! += count[bP]!
        }
        return count[aP]!
    }

    func find(_ index: String) -> String {
        if friend[index] != index {
            friend[index] = find(friend[index]!)
        }
        return friend[index]!
    }
}
print(result.map { String($0) }.joined(separator: "\n"))