typealias Edge = (s: Int, d: Int, w: Int)
let n = Int(readLine()!)!
let m = Int(readLine()!)!

var computer = [Int](0...n)
var edge = [Edge]()
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    edge.append((abc[0], abc[1], abc[2]))
}

func union(_ a: Int, _ b: Int) {
    let ap = find(a)
    let bp = find(b)
    
    computer[max(ap,bp)] = min(ap,bp)
}

func find(_ idx: Int) -> Int {
    if idx != computer[idx] {
        computer[idx] = find(computer[idx])
    }
    return computer[idx]
}

func kruskal(edge: [Edge], n: Int) -> [Edge] {
    let sorted = edge.sorted { $0.w < $1.w }
    
    var mst = [Edge]()
    for edge in sorted {
        if find(edge.d) != find(edge.s) {
            union(edge.d, edge.s)
            mst.append(edge)
        }
    }
    return mst
}

let result = kruskal(edge: edge, n: n)
print(result.reduce(0) { $0 + $1.w })
