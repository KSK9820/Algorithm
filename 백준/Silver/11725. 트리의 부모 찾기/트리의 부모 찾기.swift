let n = Int(readLine()!)!
var arr = [[Int]](repeating: [], count: n+1)
for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr[input[0]].append(input[1])
    arr[input[1]].append(input[0])
}

var stack = [Int]()
var visited = [Bool](repeating: false, count: n+1)
var parent = [Int](repeating: 0, count: n+1)
for i in arr[1] {
    stack.append(i)
    visited[i] = true
    parent[i] = 1
}
visited[1] = true

while true {
    guard let now = stack.popLast() else { break }
    
    for i in arr[now].reversed() {
        if !visited[i] {
            visited[i] = true
            parent[i] = now
            stack.append(i)
        }
    }
}
parent.removeFirst()
parent.removeFirst()
print(parent.map { String($0) }.joined(separator: "\n"))