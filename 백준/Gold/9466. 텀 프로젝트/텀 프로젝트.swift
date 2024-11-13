var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let s = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    var visited = Array(repeating: -1, count: n)
    
    for i in 0..<n {
        _ = dfs(i)
    }
    result += "\(visited.filter { $0 != 1 }.count)\n"
    
    func dfs(_ num: Int) -> Int {
        if visited[num] == -1 {
            visited[num] = 0
        } else if visited[num] == 0 {
            visited[num] = 1
            return num
        } else {
            return -1
        }
        
        var ret = dfs(s[num])
        if ret == -1 {
            visited[num] = 2
        } else {
            visited[num] = 1
            if num == ret { ret = -1 }
        }
        return ret
    }
}
result.removeLast()
print(result)