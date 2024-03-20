let t = Int(readLine()!)!
typealias Edge = (s: Int, d: Int, w: Int)
var parents = [Int]()

for _ in 0..<t {
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, c) = (rc[0], rc[1])
    var network = [Edge]()
    parents = [Int](0..<r*c)
    
    for i in 0..<r {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<c-1 {
            network.append((i*c+j, i*c+j+1, input[j]))
            network.append((i*c+j+1, i*c+j, input[j]))
        }
    }
    for i in 0..<r-1 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<c {
            network.append((i*c+j, i*c+j+c, input[j]))
            network.append((i*c+j+c, i*c+j, input[j]))
        }
    }
    print(kruskal(edge: network).reduce(0) { $0 + $1.w })
}
func union(_ a: Int, _ b: Int) {
    let ap = find(a)
    let bp = find(b)
    
    parents[max(ap, bp)] = min(ap, bp)
}
func find(_ index: Int) -> Int {
    if parents[index] != index {
        parents[index] = find(parents[index])
    }
    return parents[index]
}
func kruskal(edge: [Edge]) -> [Edge] {
    let sortedEdge = edge.sorted { $0.w < $1.w }
    var mst = [Edge]()
    
    for e in sortedEdge {
        if find(e.s) != find(e.d) {
            union(e.s, e.d)
            mst.append(e)
        }
    }
    return mst
}