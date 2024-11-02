let n = Int(readLine()!)!
let top = readLine()!.split(separator: " ").map { Int($0)! }
var stack = [(v: Int, i: Int)]()
var result = [Int](repeating: 0, count: n)

for i in 0..<n {
    if stack.isEmpty {
        stack.append((top[i], i+1))
        continue
    }
    
    if stack.last!.v < top[i] {
        while true {
            guard let last = stack.last else { break }
            if last.v > top[i] {
                result[i] = stack.last!.i
                break
            } else {
                stack.removeLast()
            }
        }
        stack.append((top[i], i+1))
    } else {
        result[i] = stack.last!.i
        stack.append((top[i], i+1))
    }
        
}

print(result.map { String($0) }.joined(separator: " "))