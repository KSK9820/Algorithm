let t = Int(readLine()!)!
var result = [[Int]](repeating: [], count: t)

for tt in 0..<t {
    let n = Int(readLine()!)!
    var network = [Int](0...n-1)
    
    for _ in 0..<Int(readLine()!)! {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        union(ab[0], ab[1])
    }
    
    for _ in 0..<Int(readLine()!)! {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        result[tt].append(find(uv[0]) == find(uv[1]) ? 1 : 0)
    }
    
    func union(_ a: Int, _ b: Int) {
        let aP = find(a)
        let bP = find(b)
        
        network[max(aP, bP)] = min(aP, bP)
    }

    func find(_ index: Int) -> Int {
        if index != network[index] {
            network[index] = find(network[index])
        }
        return network[index]
    }
}

var r = ""
for i in 1...t {
   r += "Scenario \(i):\n"
    for j in 0..<result[i-1].count {
        r += "\(result[i-1][j])\n"
    }
    r += "\n"
}
r.removeLast()
print(r)