
let n = Int(readLine()!)!
var s = [[Int]](repeating: [], count: n)
for i in 0..<n {
    s[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var item = Array(0..<n)
var selected = [Int]()
var result = Int.max

func dfs(_ idx: Int, _ mask: Int) {
    if !selected.isEmpty {
        let start = getAbility(selected)
        let link = getAbility(Array(Set(0..<n).subtracting(Set(selected))))
        result = min(result, abs(start-link))
    }
    if selected.count == n - 1 { return }
    if idx == n-1 { return }
    
    dfs(idx+1, mask)
    selected.append(idx)
    dfs(idx+1, mask | (1<<idx))
    selected.removeLast()
}


func getAbility(_ arr: [Int]) -> Int {
    var result = 0
    
    for i in 0..<arr.count {
        for j in (i+1)..<arr.count {
            let a = arr[i], b = arr[j]
            result += s[a][b] + s[b][a]
        }
    }
    
    return result
}

dfs(0, 0)
print(result)
