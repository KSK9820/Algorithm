let n = Int(readLine()!)!
let chonsu = readLine()!.split(separator: " ").map { Int($0)! }
let (c1, c2) = (chonsu[0], chonsu[1])
let m = Int(readLine()!)!
var arr = [[Int]](repeating: [], count: n+1)
var visited = Array(repeating: false, count: n+1)
for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int($0)!}
    let (x, y) = (xy[0], xy[1])
    arr[x].append(y)
    arr[y].append(x)
}

var result = -1
func dfs(p: Int, count: Int) {
    
    if p == c2 { result = count; return }
    
    for a in arr[p] {
        if visited[a] == false {
            visited[a] = true
            dfs(p: a, count: count + 1)
            
        }
    }
}

dfs(p: c1, count: 0)
print(result)
