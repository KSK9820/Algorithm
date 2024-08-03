let lc = readLine()!.split(separator: " ").map { Int($0)! }
let (l,c) = (lc[0], lc[1])
let alphabet = readLine()!.split(separator: " ").map { String($0 )}.sorted()
var visited = Array(repeating: false, count: c)
var selected = Array(repeating: "", count: l)
var result = ""

func backTracking(_ idx: Int, _ sidx: Int) {
    if idx == l {
        let set = Set(selected)
        let vowel = set.intersection(Set(["a", "e", "i", "o", "u"])).count
        let consonent = l - vowel
        if vowel >= 1 && consonent >= 2  {
            let password = selected.joined()
            result += "\(password)\n"
        }
        return
    }
    
    for i in sidx..<c {
        if !visited[i] {
            visited[i] = true
            selected[idx] = alphabet[i]
            backTracking(idx+1, i)
            visited[i] = false
        }
    }
}

backTracking(0,0)
result.removeLast()
print(result)
