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

var rail = Queue<(p: Int, w: Int)>()
var ware = [(p: Int, w: Int)]()
var info = [Int](repeating: 0, count: m+1)

for _ in 0..<n {
    let pw = readLine()!.split(separator: " ").map { Int($0)! }
    rail.enqueue((pw[0], pw[1]))
    info[pw[0]] += 1
}

var result = 0
while true {
    guard let now = rail.dequeue() else { break }
    
    if now.p < info.count - 1 {
        rail.enqueue(now)
        result += now.w
        
        continue
    }
    
    if ware.isEmpty {
        ware.append(now)
        result += now.w
        if info[now.p] == 1 {
            info.removeLast()
        } else {
            info[now.p] -= 1
        }
        
        continue
    }
    
    if now.w > ware.last!.w && now.p == ware.last!.p {
        var temp = [(p: Int, w: Int)]()
        while !ware.isEmpty {
            if now.w > ware.last!.w && now.p == ware.last!.p {
                let w = ware.removeLast()
                temp.append(w)
                result += w.w
            } else { break }
        }
        ware.append(now)
        result += now.w
        
        temp.reversed().forEach {
            ware.append($0)
            result += $0.w
        }
    } else {
        ware.append(now)
        result += now.w
    }
    
    if info[now.p] == 1 {
        info.removeLast()
    } else {
        info[now.p] -= 1
    }
    
}
                 
print(result)


