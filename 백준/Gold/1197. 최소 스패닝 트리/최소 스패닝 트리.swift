let ve = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e) = (ve[0], ve[1])

typealias Edge = (source: Int, destination: Int, weight: Int)
var edges = [Edge]()
var parents = [Int](0..<v)

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append((abc[0]-1, abc[1]-1, abc[2]))
}

func union(_ a: Int, _ b: Int) {
    let ap = find(a)
    let bp = find(b)
    
    parents[max(ap, bp)] = min(ap, bp)
}

func find(_ index: Int) -> Int {
    if index != parents[index] {
        parents[index] = find(parents[index])
    }
    return parents[index]
}

func kruskal(edges: [Edge], numberOfVertice: Int) -> [Edge] {
    let sortedEdges = edges.sorted { $0.weight < $1.weight }
    var mst = [Edge]()
    
    for edge in sortedEdges {
        if find(edge.source) != find(edge.destination) {
            union(edge.source, edge.destination)
            mst.append(edge)
        }
    }
    return mst
}

let mst = kruskal(edges: edges, numberOfVertice: v)
print(mst.reduce(0) { $0 + $1.weight})