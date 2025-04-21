
let n = Int(readLine()!)!
var tree = [[Int]](repeating: [], count: n+1)
for _ in 0..<n-1 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    tree[ab[0]].append(ab[1])
    tree[ab[1]].append(ab[0])
}

var parent = Array(repeating: -1, count: n+1)
var depth = Array(repeating: 0, count: n+1)

dfs(1, d: 0, p: -1)
var result = ""
for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(findLCA(ab[0], ab[1]))\n"
}
print(result)


func dfs(_ node: Int, d: Int, p: Int) {
    depth[node] = d
    parent[node] = p
    
    for next in tree[node] {
        if next != p {
            dfs(next, d: d+1, p: node)
        }
    }
}


func findLCA(_ u: Int, _ v: Int) -> Int {
    var u = u
    var v = v
    
    while depth[u] != depth[v] {
        if depth[u] > depth[v] {
            u = parent[u]
        } else {
            v = parent[v]
        }
    }
    
    while u != v {
        u = parent[u]
        v = parent[v]
    }
    
    return u
}
