let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var count = 0
    var countries = [Int](0..<n)
    
    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (ab[0], ab[1])
        
        let aP = find(a - 1)
        let bP = find(b - 1)
        
        if aP != bP {
            count += 1
            countries[bP] = aP
        }
        
    }
    print(count)
    func find(_ index: Int) -> Int {
        if countries[index] != index {
            return find(countries[index])
        }
        return countries[index]
    }
}