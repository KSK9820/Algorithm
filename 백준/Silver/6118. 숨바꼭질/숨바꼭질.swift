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


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var farm = Array(repeating: [Int](), count: n+1)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    farm[ab[0]].append(ab[1])
    farm[ab[1]].append(ab[0])
}

var q = Queue<(num: Int, c: Int)>()
var visited = Array(repeating: Int.max, count: n+1)
q.enqueue((1,0))
visited[1] = 0
var result = 0
var count = 0
var num = Int.max
while true {
    guard let now = q.dequeue() else { break }
    if now.c > visited[now.num] { continue }
    
    if now.c > result {
        num = now.num
        result = now.c
        count = 1
    } else if now.c == result {
        num = min(num, now.num)
        count += 1
    }
    
    for i in farm[now.num] {
        if visited[i] > now.c + 1 {
            visited[i] = now.c + 1
            q.enqueue((i, now.c + 1))
        }
    }
    
}
print(num, result, count)

