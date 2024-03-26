
let fsgud = readLine()!.split(separator: " ").map { Int($0)! }
let (f, s, g, u, d) = (fsgud[0], fsgud[1], fsgud[2], fsgud[3], fsgud[4])
var q = Queue<(u: Int, d: Int)>()
var visited = [Bool](repeating: false, count: f+1)
var result = -1
q.enqueue((0,0))


if s > g && d == 0 { }
else if s < g && u == 0 { }
else {
    while true {
        guard let now = q.dequeue() else { break }
        
        if now.u * u - now.d * d + s == g {
            result = now.d + now.u
            break
        }
        
        if now.u * u - now.d * d + s <= f && now.u * u - now.d * d + s > 0 {
            if visited[now.u * u - now.d * d + s] { continue }
            visited[now.u * u - now.d * d + s] = true
            
            if (now.u + 1) * u - (now.d) * d + s <= f && !visited[(now.u + 1) * u - (now.d) * d + s] {
                q.enqueue((now.u+1, now.d))
            }
            
            if (now.u) * u - (now.d+1) * d + s > 0 && !visited[(now.u) * u - (now.d + 1) * d + s] {
                q.enqueue((now.u, now.d + 1))
            }
        }
    }
}

result == -1 ? print("use the stairs") : print(result)

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
