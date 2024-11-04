let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: -1, count: n)
var stack = [Int]()



for i in (0..<n).reversed() {
    if stack.isEmpty {
        stack.append(arr[i])
        continue
    }
    
    if stack.last! > arr[i] {
        result[i] = stack.last!
        stack.append(arr[i])
        continue
    }
    
    while true {
        if stack.isEmpty {
            break
        }
        
        if stack.last! <= arr[i] {
            stack.removeLast()
        } else {
            result[i] = stack.last!
            break
        }
    }
    stack.append(arr[i])
}
print(result.map { String($0) }.joined(separator: " "))