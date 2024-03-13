import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

typealias Edge = (s: Int, d: Int, w: Double)
var parent = [Int](0..<n)
var location = [(x: Double, y: Double)]()
var edge = [Edge]()

for i in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Double($0)! }
    location.append((xy[0], xy[1]))
}
for _ in 0..<m {
    let sd = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    union(sd[0], sd[1])
}

for i in 0..<n-1 {
    for j in i+1..<n {
        if i == j { continue }
        let distance = getDistance(i, j)
        edge.append((i+1, j+1, distance))
    }
}



func getDistance(_ s: Int, _ d: Int) -> Double {
    return sqrt(pow(abs(location[s].x - location[d].x), 2.0) + pow((abs(location[s].y - location[d].y)), 2.0))
}

func kruskal(edges: [Edge], vertice: Int) -> [Edge] {
    let sortedEdges = edges.sorted { $0.w < $1.w }
    var mst = [Edge]()
    
    for edge in sortedEdges {
        if find(edge.s-1) != find(edge.d-1) {
            union(edge.s-1, edge.d-1)
            mst.append(edge)
        }
    }
    return mst
}
let result = kruskal(edges: edge, vertice: n)
print(String(format: "%.2f", (result.reduce(0) { $0 + $1.w } * 100).rounded() / 100))


func find(_ index: Int) -> Int {
    if parent[index] != index {
        parent[index] = find(parent[index])
    }
    return parent[index]
}

func union(_ a: Int, _ b: Int) {
    let ap = find(a)
    let bp = find(b)
    
    parent[max(ap, bp)] = min(ap, bp)
}
