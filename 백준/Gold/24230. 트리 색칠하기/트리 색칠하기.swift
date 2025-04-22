
let n = Int(readLine()!)!
let c = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var tree = [[Int]](repeating: [], count: n+1)
for _ in 0..<n-1 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    tree[ab[0]].append(ab[1])
    tree[ab[1]].append(ab[0])
}


var result = c[1] != 0 ? 1 : 0
  
var v = Array(repeating: false, count: n+1)

func dfs(_ n: Int) {
    if v[n] { return }
    v[n] = true
    
    for next in tree[n] {
        if v[next] { continue }
        if c[n] != c[next] { result += 1 }
        dfs(next)
    }
}

dfs(1)
print(result)

