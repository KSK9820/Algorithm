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

var result = ""
let masks: [Int] = [
    (1<<0)|(1<<1)|(1<<2),
    (1<<3)|(1<<4)|(1<<5),
    (1<<6)|(1<<7)|(1<<8),

    (1<<0)|(1<<3)|(1<<6),
    (1<<1)|(1<<4)|(1<<7),
    (1<<2)|(1<<5)|(1<<8),
    
    (1<<0)|(1<<4)|(1<<8),
    (1<<2)|(1<<4)|(1<<6)
]
for _ in 0..<Int(readLine()!)! {
    var start = 0
    for i in 0..<3 {
        let input = readLine()!.split(separator: " ")
        
        for j in 0..<3 {
            if input[j] == "T" {
                start |= (1 << (i*3+j))
            }
        }
    }
    
    var q = Queue<(state: Int, c: Int)>()
    var visited = [Bool](repeating: false, count: 512)
    q.enqueue((start, 0))
    visited[start] = true
    
    while true {
        guard let now = q.dequeue() else { result += "-1\n"; break }
        
        if now.state == 0 || now.state == 511 { result += "\(now.c)\n"; break }
        for mask in masks {
            let new = now.state ^ mask
            if visited[new] { continue }
            visited[new] = true
            q.enqueue((new, now.c + 1))
        }
    }
}
print(result)