
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var f = [[Int]](repeating: [Int](), count: n)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    f[ab[0]].append(ab[1])
    f[ab[1]].append(ab[0])
}

var result = 0
var v = Array(repeating: false, count: n)
var friend = Array(repeating: 0, count: 5)
func dfs(_ idx: Int, depth: Int) {
    if depth == 5 {
        result = 1
        return
    }
    if result == 1 { return }
    
    for j in f[idx] {
        if v[j] { continue }
        v[j] = true
        friend[depth] = j
        dfs(j, depth: depth + 1)
        if result == 1 {
            v[j] = false
            return
        }
        v[j] = false
    }
}

for i in 0..<n where result != 1 {
    v[i] = true
    friend[0] = i
    dfs(i, depth: 1)
    v[i] = false
}
print(result)
