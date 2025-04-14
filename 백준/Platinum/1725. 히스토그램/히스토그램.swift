

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)
for i in 0..<n {
    arr[i] = Int(readLine()!)!
}

var stack = [Int]()
var result = 0
for i in 0..<n {
    if stack.isEmpty {
        stack.append(i)
        result = max(result, arr[i])
        continue
    }
    
    let now = arr[stack.last!]
    
    if now <= arr[i] {
        stack.append(i)
    } else {
        while !stack.isEmpty && arr[stack.last!] > arr[i] {
            let topIndex = stack.removeLast()
            let height = arr[topIndex]
            let width = stack.isEmpty ? i : (i - stack.last!) - 1
            
            result = max(result, width * height)
        }
        stack.append(i)
    }
}

while !stack.isEmpty {
    let topIndex = stack.removeLast()
    let height = arr[topIndex]
    let width = stack.isEmpty ? n : (n - stack.last!) - 1
    
    result = max(result, width * height)
}

print(result)
