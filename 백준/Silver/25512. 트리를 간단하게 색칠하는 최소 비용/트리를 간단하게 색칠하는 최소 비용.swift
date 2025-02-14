struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        
        return output.popLast()
    }
}

let n = Int(readLine()!)!
var tree = [[Int]](repeating: [], count: n)
var cost = [(w: Int, b: Int)]()
for _ in 1..<n {
    let pc = readLine()!.split(separator: " ").map { Int($0)! }
    let (p,c) = (pc[0], pc[1])
    
    tree[p].append(c)
}
var totalCost = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    cost.append((input[0], input[1]))
    totalCost += input[0] + input[1]
}

var result = 0
var q = Queue<(idx: Int, depth: Int)>()
q.enqueue((0, 0))

while true {
    guard let now = q.dequeue() else { break }
    
    result += now.depth == 0 ? cost[now.idx].w : cost[now.idx].b
    
    for i in tree[now.idx] {
        q.enqueue((i, (now.depth + 1) % 2))
    }
}
print(min(result, totalCost - result))
