struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    mutating func enqueue(_ new: T) {
        input.append(new)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}

for _ in  0..<Int(readLine()!)! {
    let ve = readLine()!.split(separator: " ").map { Int($0)! }
    let (v, e) = (ve[0], ve[1])
    
    var graph = Array(repeating: [Int](), count: v+1)
    var binary = Array(repeating: false, count: v+1)
    var visited = Array(repeating: false, count: v+1)
    for i in 0..<e {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        graph[uv[0]].append(uv[1])
        graph[uv[1]].append(uv[0])
    }
    
    // bfs
    var q = Queue<(Int, Bool)>()
    
    for i in 1...v {
        if visited[i] { continue }
        visited[i] = true
        q.enqueue((i, true))
        binary[i] = true
        
        while true {
            guard let now = q.dequeue() else { break }
            
            for i in graph[now.0] {
                if visited[i] { continue }
                visited[i] = true
                binary[i] = !now.1
                q.enqueue((i, !now.1))
            }
        }
    }

    // dfs
    var result = "YES"
    var s = [Int]()
    visited = Array(repeating: false, count: v+1)

    for i in 1...v {
        if visited[i] { continue }
        visited[i] = true
        s.append(i)
        
    outer: while true {
        guard let now = s.popLast() else { break }
        
        for i in graph[now] {
            if binary[now] == binary[i] {
                result = "NO"
                break outer
            } else {
                if visited[i] { continue }
                visited[i] = true
                s.append(i)
            }
        }
    }
    }
    print(result)
    
}