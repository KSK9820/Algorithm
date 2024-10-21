let n = Int(readLine()!)!
var visited = [Int](0...n)

if n == 1 {
    print(0)
    print(1)
} else {
    for i in (2...n) {
        if i % 2 == 0 {
            visited[i] = min(visited[i], visited[i/2] + 1)
        }
        if i % 3 == 0 {
            visited[i] = min(visited[i], visited[i/3] + 1)
        }
        
        visited[i] = min(visited[i], visited[i-1] + 1)
        
    }
    
    var idx = n
    var result = "\(idx) "
    while idx > 0 {
        if visited[idx] == visited[idx-1] + 1 {
            idx = idx - 1
        } else if idx % 2 == 0 && visited[idx] == visited[idx/2] + 1 {
            idx = idx / 2
        } else if idx % 3 == 0 && visited[idx] == visited[idx/3] + 1 {
            idx = idx / 3
        }
        result += "\(idx) "
    }
    result.removeLast()
    result.removeLast()
    print(visited[n]-1)
    print(result)
}