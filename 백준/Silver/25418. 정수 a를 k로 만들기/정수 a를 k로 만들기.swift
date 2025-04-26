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


let ak = readLine()!.split(separator: " ").map { Int($0)! }
let (a,k) = (ak[0], ak[1])
var visited = Array(repeating: Int.max, count: k+1)
var q = Queue<(n: Int, c: Int)>()
q.enqueue((a, 0))
visited[a] = 0
while true {
    guard let now = q.dequeue() else { break }
    if now.n == k { print(now.c); break }
    
    if now.n + 1 <= k && visited[now.n+1] > now.c + 1 {
        q.enqueue((now.n + 1, now.c + 1))
        visited[now.n + 1] = now.c + 1
    }
    if now.n * 2 <= k && visited[now.n*2] > now.c + 1 {
        q.enqueue((now.n * 2, now.c + 1))
        visited[now.n * 2] = now.c + 1
    }
}
