let n = Int(readLine()!)!
var f = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    f[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let mx = [0,0,-1,1,0]
let my = [1,-1,0,0,0]

var result = Int.max

func available(y: Int, x: Int, seed: [(y: Int, x: Int)]) -> Bool {
    for i in 0..<5 {
        if seed.contains(where: { yx in
            y + my[i] == yx.y && x + mx[i] == yx.x
        }) {
            return false
        }
    }
    
    return true
}

func dfs(_ planted: [(y: Int, x: Int)], total: Int) {
    if total >= result { return }
    if planted.count == 15 {
        result = min(result, total)
        return
    }
    
    for i in 1..<n-1 {
        for j in 1..<n-1 {
            if available(y: i, x: j, seed: planted) == false { continue }
            var p = [(i,j)]
            var t = f[i][j]
            
            for k in 0..<4 {
                p.append((i+my[k], j+mx[k]))
                t += f[i+my[k]][j+mx[k]]
            }
            
            dfs(planted + p, total: total + t)
        }
    }
}

dfs([], total: 0)
print(result)

