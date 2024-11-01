let n = Int(readLine()!)!
var building = [Int]()
for _ in 0..<n {
    building.append(Int(readLine()!)!)
}

var stack = [(v: Int, i: Int)]()
var result = 0

for b in 0..<n {
    if stack.isEmpty {
        stack.append((building[b],b))
        continue
    }
    
    if stack.last!.v > building[b] {
        result += stack.count
        stack.append((building[b], b))
    } else {
        for s in (0..<stack.count).reversed() {
            if stack.last!.v > building[b] {
                break
            } else {
                stack.popLast()
            }
        }
        result += stack.count
        stack.append((building[b],b))
    }
}

print(result)