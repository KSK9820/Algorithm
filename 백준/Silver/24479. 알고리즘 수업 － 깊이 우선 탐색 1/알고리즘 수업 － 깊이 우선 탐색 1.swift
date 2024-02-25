let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])

var visited = [Bool](repeating: false, count: n + 1)
var edges = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    edges[uv[0]].append(uv[1])
    edges[uv[1]].append(uv[0])
}

for i in 1...n {
    edges[i] = edges[i].sorted(by : <)
}

var result = [Int](repeating: 0, count: n+1)
var count = 0
func dfs(r: Int) {
    if visited[r] == true && result[r] != 0 { return }
    visited[r] = true
    count += 1
    result[r] = count
    for edge in edges[r] {
        if visited[edge] == false {
            dfs(r: edge)
        }
    }
}
dfs(r: r)
result.removeFirst()
print(result.map { String($0) }.joined(separator: "\n"))
