
let NP = readLine()!.split(separator: " ").map { Int($0)! }
let (N,P) = (NP[0], NP[1])

var stack = Array(repeating: [Int](), count: N+1)
var result = 0

for _ in 0..<N {
    let lp = readLine()!.split(separator: " ").map { Int($0)! }
    let (l,p) = (lp[0], lp[1])
    
    if stack[l].isEmpty {
        stack[l].append(p)
        result += 1
        continue
    }
    
    while true {
        guard let last = stack[l].last else {
            stack[l].append(p)
            result += 1
            break
        }
        
        if last > p {
            result += 1
            _ = stack[l].popLast()
        } else if last == p {
            break
        } else {
            stack[l].append(p)
            result += 1
            break
        }
    }
}

print(result)
