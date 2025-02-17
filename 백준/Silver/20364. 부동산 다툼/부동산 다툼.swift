let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n,q) = (nq[0], nq[1])

var arr = Array(repeating: 0, count: q)
for i in 0..<q {
    arr[i] = Int(readLine()!)!
}

var visited = [Bool](repeating: false, count: n+1)

func findParent(idx: Int, meet: Int) -> Int {
    if idx == 0 { return meet }
    if visited[idx] == true {
        return findParent(idx: idx/2, meet: idx)
    }
    
    return findParent(idx: idx/2, meet: meet)
}
var result = ""
for i in arr {
    let cango = findParent(idx: i, meet: 0)
    if cango == 0 {
        visited[i] = true
        result += "\(0)\n"
    } else {
        result += "\(cango)\n"
    }
}

print(result)
