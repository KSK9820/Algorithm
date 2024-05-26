let n = Int(readLine()!)!
let m = Int(readLine()!)!
var friend = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)
for i in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b) = (ab[0], ab[1])
    friend[a].append(b)
    friend[b].append(a)
}

var stack = friend[1]

visited[1] = true
while true {
    guard let now = stack.popLast() else { break }
    visited[now] = true
    for f in friend[now] {
        if visited[f] { continue }
        visited[f] = true
    }
}
print(visited.filter { $0 == true }.count - 1)
