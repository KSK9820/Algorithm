
struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}


let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m , v) = (nmv[0], nmv[1], nmv[2])
var graph = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
for i in 0..<m {
    let number = readLine()!.split(separator: " ").map { Int($0)! }
    graph[number[0]].append(number[1])
    graph[number[1]].append(number[0])
}

//DFS
var dfsVisited = [Bool](repeating: false, count: n+1)
var dfs = [Int]()
//var s = [v]

dfs(go: v)

    
func dfs(go: Int) {
    if dfsVisited[go] == true { return }
    dfsVisited[go] = true
    dfs.append(go)
    
    for i in graph[go].sorted() {
        if dfsVisited[i] == false {
            dfs(go: i)
        }
    }
}
print(dfs.map { String($0) }.joined(separator: " "))


// BFS
var q = Queue<Int>()
var bfsVisited = [Bool](repeating: false, count: n+1)
var bfs = [Int]()
q.enqueue(v)
while true {
    guard let willGo = q.dequeue() else { break }
    
    if bfsVisited[willGo] == false {
        bfsVisited[willGo] = true
        bfs.append(willGo)
    } else {
        continue
    }
    for go in graph[willGo].sorted() {
        if bfsVisited[go] == false {
            q.enqueue(go)
        }
    }
}
print(bfs.map { String($0) }.joined(separator: " "))


