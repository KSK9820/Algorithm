import Foundation
func getDistance(a: Star, b: Star) -> Double {
    let deltaX = b.x - a.x
    let deltaY = b.y - a.y
    return sqrt(deltaX * deltaX + deltaY * deltaY)
}
typealias Edge = (s: Int, d: Int, w: Double)
typealias Star = (x: Double, y: Double)
let n = Int(readLine()!)!
var star = [Star]()
for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Double($0)! }
    star.append((xy[0], xy[1]))
}

var edges = [Edge]()
var parent = [Int](0..<n)
for i in 0..<n-1 {
    for j in (i+1)..<n {
        edges.append((s: i, d: j, w: getDistance(a: star[i], b: star[j])))
    }
}

func union(_ a: Int, _ b: Int) {
    let ap = find(a)
    let bp = find(b)
    parent[max(ap,bp)] = min(ap,bp)
}

func find(_ index: Int) -> Int {
    if index != parent[index] {
        parent[index] = find(parent[index])
    }
    return parent[index]
}

func kruskal(edges: [Edge], numberOfVertice: Int) -> [Edge] {
    let sortedEdges = edges.sorted { $0.w < $1.w }
    var mst = [Edge]()
    
    for edge in sortedEdges {
        if find(edge.s) != find(edge.d) {
            union(edge.s, edge.d)
            mst.append(edge)
        }
    }
    return mst
}


let mst = kruskal(edges: edges, numberOfVertice: n)
let result = mst.reduce(0.0) { (result, star) in result + star.w }
print(String(result).prefix(4))

