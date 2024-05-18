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
    
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var q = Queue<(x: Int, t: Int)>()
var visited = [Int](repeating: Int.max, count: 100001)
q.enqueue((n,0))
visited[n] = 0

while true {
    guard let now = q.dequeue() else { break }
    if now.x == k { break }
    
    if now.x * 2 > 0 && now.x * 2 < 100001 && visited[now.x * 2] > now.t {
        q.enqueue((now.x * 2, now.t))
        visited[now.x * 2] = now.t
    }
    if  now.x + 1 > 0 && now.x + 1 < 100001 && visited[now.x + 1] > now.t + 1{
        q.enqueue((now.x + 1, now.t + 1))
        visited[now.x+1] = now.t + 1
    }
    if now.x - 1 >= 0 && now.x - 1 < 100000 && visited[now.x - 1] > now.t + 1 {
        q.enqueue((now.x - 1, now.t + 1))
        visited[now.x-1] = now.t + 1
    }
}
print(visited[k])
