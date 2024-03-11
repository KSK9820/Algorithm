
let t = Int(readLine()!)!
var result = [Int]()
for _ in 0..<t {
    let f = Int(readLine()!)!
    var index = 0
    var dict = [String : Int]()
    var root = [Int](repeating: 1, count: 2 * f)
    var friend = [Int](0..<(2*f))
    
    for _ in 0..<f {
        let input = readLine()!.split(separator: " ").map { String($0) }
        if dict[input[0]] == nil {
            dict[input[0]] = index
            index += 1
        }
        if dict[input[1]] == nil {
            dict[input[1]] = index
            index += 1
        }
       
        union(dict[input[0]]!, dict[input[1]]!)
        result.append(root[find(dict[input[0]]!)])
    }
    
    func union(_ a: Int, _ b: Int) {
        let aP = find(a)
        let bP = find(b)
        
        if aP != bP {
            friend[min(aP, bP)] = max(aP, bP)
            root[max(aP, bP)] += root[min(aP, bP)]
        }
    }

    func find(_ index: Int) -> Int {
        if friend[index] != index {
            friend[index] = find(friend[index])
        }
        return friend[index]
    }

}
print(result.map { String($0) }.joined(separator: "\n"))