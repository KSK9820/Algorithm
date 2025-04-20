
var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    
    var tree = [[Int]](repeating: [], count: n+1)
    var parent = [Int](repeating: -1, count: n+1)
    for _ in 0..<n-1 {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        tree[ab[0]].append(ab[1])
        parent[ab[1]] = ab[0]
    }
    
    var root = 1
    for i in 1...n {
        if parent[i] == -1 {
            root = i
            break
        }
    }
    
    var depth = [Int](repeating: 0, count: n+1)
    
    func dfs(node: Int, d: Int) {
        depth[node] = d
        tree[node].forEach { dfs(node: $0, d: d+1) }
    }
    
    dfs(node: root, d: 0)
    
    func findLCA(u: Int, v: Int) -> Int {
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
    
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(findLCA(u: nodes[0], v: nodes[1]))\n"
    
}

print(result)
