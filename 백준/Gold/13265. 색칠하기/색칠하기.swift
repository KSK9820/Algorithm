var result = ""
for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m) = (nm[0], nm[1])
    
    var arr = Array(repeating: [Int](), count: n+1)
    for _ in 0..<m {
        let xy = readLine()!.split(separator: " ").map { Int($0)! }
        
        arr[xy[0]].append(xy[1])
        arr[xy[1]].append(xy[0])
    }
    
    // 3: null
    // color: 0,1
    var answer = "possible"
    var visited = Array(repeating: 3, count: n+1)
    outer: for i in 1...n {
        if arr[i].isEmpty { continue }
        if visited[i] != 3 { continue }
        var stack = [(num: Int, bef: Int)]()
        
        visited[i] = 0
        stack.append((i, 0))
        
        while true {
            guard let now = stack.popLast() else { break }
            for j in arr[now.num] {
                if visited[j] == 3 {
                    visited[j] = (now.bef + 1) % 2
                    stack.append((j, visited[j]))
                } else if visited[j] == now.bef {
                    answer = "impossible"
                    break outer
                }
            }
        }
    }
    result += "\(answer)\n"
}
print(result)
