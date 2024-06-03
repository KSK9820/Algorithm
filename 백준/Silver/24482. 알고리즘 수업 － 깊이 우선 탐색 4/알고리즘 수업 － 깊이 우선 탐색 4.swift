
let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,r) = (nmr[0], nmr[1], nmr[2])

var tree = [[Int]](repeating: [], count: n+1)
var visited = [Int](repeating: Int.max, count: n+1)
var stack = [(num: Int, depth: Int)]()
for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    tree[uv[0]].append(uv[1])
    tree[uv[1]].append(uv[0])
}

for t in 1...n {
    tree[t] = tree[t].sorted(by: <)
}


stack.append((r,0))
while true {
    guard let now = stack.popLast() else { break }
    if visited[now.num] != Int.max { continue }
    visited[now.num] = now.depth

    for tree in tree[now.num] {
        
        stack.append((tree, now.depth+1))
    }
}

visited.removeFirst()
print(visited.map { $0 == Int.max ? "-1" : String($0) }.joined(separator: "\n"))
