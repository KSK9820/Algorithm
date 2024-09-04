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

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var visited = Array(repeating: Int.max, count: 100002)
var q = Queue<(loc: Int, time: Int)>()
q.enqueue((n,0))
visited[n] = 0


var count = 0
var miniumTime = Int.max
while true {
    guard let subin = q.dequeue() else { break }
    
    if subin.time > miniumTime { continue }
    if subin.loc == k {
        if miniumTime > subin.time {
            miniumTime = subin.time
            count = 1
        } else if miniumTime == subin.time {
            count += 1
        }
        continue
    }
    
    if subin.loc - 1 >= 0 && visited[subin.loc - 1] >= subin.time + 1 {
        q.enqueue((subin.loc - 1, subin.time + 1))
        visited[subin.loc - 1] = subin.time + 1
    }
    if subin.loc + 1 <= 100000 && visited[subin.loc + 1] >= subin.time + 1 {
        q.enqueue((subin.loc + 1, subin.time + 1))
        visited[subin.loc + 1] = subin.time + 1
    }
    if subin.loc * 2 <= 100000 && visited[subin.loc * 2] >= subin.time + 1 {
        q.enqueue((subin.loc * 2, subin.time + 1))
        visited[subin.loc * 2] = subin.time + 1
    }
    
}
print(miniumTime)
print(count)
