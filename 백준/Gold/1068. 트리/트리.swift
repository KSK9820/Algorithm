let n = Int(readLine()!)!
var node = readLine()!.split(separator: " ").map { Int($0)! }
var graph = Array(repeating: [Int](), count: n)
var root = 0
for i in node.indices {
    if node[i] == -1 {
        root = i
        continue
    }
    graph[node[i]].append(i)
}
let remove = Int(readLine()!)!

var result = 0
var stack = [root]
if root != remove {
    while true {
        guard let now = stack.popLast() else { break }
        
        if graph[now] == [] && now != remove {
            result += 1
        } else {
            for i in graph[now] {
                if i == remove {
                    if graph[now].count == 1 { result += 1 }
                    continue
                } else {
                    stack.append(i)
                }
            }
        }
    }
}
print(result)
