
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
    
    var count: Int {
        input.count + output.count
    }
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
}



let s = Int(readLine()!)!
var visited = Array(repeating: false, count: s * 2 + 1)
var q = Queue<(n: Int, p: Int, c: Int)>()
q.enqueue((1,0,0))
visited[1] = true
var result = Int.max

while true {
    guard let now = q.dequeue() else { break }
    
    if now.n == s {
        result = now.c
        print(result)
        break
    }
    
    // 복사
    if now.n * 2 < visited.count && !visited[now.n * 2] {
        q.enqueue((now.n, now.n, now.c + 1))
    }
    
    // 붙여넣기
    if now.p != 0 && now.n + now.p < visited.count {
        visited[now.n + now.p] = true
        q.enqueue((now.n + now.p, now.p, now.c + 1))
    }
    
    // 삭제
    if now.n - 1 != 0 && !visited[now.n - 1] {
        visited[now.n - 1] = true
        q.enqueue((now.n - 1, now.p, now.c + 1))
    }
}

