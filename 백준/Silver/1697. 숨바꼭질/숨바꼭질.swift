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

var q = Queue<(loc: Int, time: Int)>()
q.enqueue((n, 0))

var visited = Array(repeating: false, count: 100001)
let m = [-1, 1]
while true {
    guard let subin = q.dequeue() else { break }
    if subin.loc == k { print(subin.time); break }
    
    for i in 0..<2 {
        let newloc = subin.loc + m[i]
        if newloc < 0 || newloc > 100000 { continue }
        
        if visited[newloc] { continue }
        visited[newloc] = true
        
        q.enqueue((newloc, subin.time + 1))
    }
    
    let newloc = subin.loc * 2
    if newloc < 0 || newloc > 100000 { continue }
    
    if visited[newloc] { continue }
    visited[newloc] = true
    
    q.enqueue((newloc, subin.time + 1))
}
