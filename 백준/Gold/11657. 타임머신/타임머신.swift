let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

struct Edge {
    let from: Int
    let to: Int
    let w: Int
}
var arr = [Edge]()
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(Edge(from: abc[0]-1, to: abc[1]-1, w: abc[2]))
}
var distance = Array(repeating: Int.max, count: n)

func bellmanFord(_ s: Int, edges: [Edge], n: Int) -> Bool {
    distance[s] = 0
    
    for _ in 0..<n-1 {
        for edge in edges {
            let u = edge.from
            let v = edge.to
            let w = edge.w
        
            if distance[u] != Int.max && distance[u] + w < distance[v] {
                distance[v] = distance[u] + w
            }
        }
    }
    
    for edge in edges {
        let u = edge.from
        let v = edge.to
        let w = edge.w
        
        if distance[u] != Int.max && distance[u] + w < distance[v] {
            return false
        }
    }
    return true
}

if bellmanFord(0, edges: arr, n: n) {
    var result = ""
    for d in 1..<n {
        result += distance[d] == Int.max ? "-1\n" : "\(distance[d])\n"
    }
    print(result)
} else {
    print(-1)
}
