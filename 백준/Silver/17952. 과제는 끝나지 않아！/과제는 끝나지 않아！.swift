let n = Int(readLine()!)!

var stack = [(a: Int, t: Int)]()
var score = 0
var result = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }

    if input[0] == 0 {
        result += 1
        
        if !stack.isEmpty {
            if stack.last!.t == result {
                score += stack.last!.a
                stack.popLast()
                result = 0
            }
        }
    } else {
        guard let hw = stack.popLast() else {
            stack.append((input[1], input[2]))
            result = 1
            continue
        }
        
        if hw.t == result {
            score += hw.a
        } else {
            stack.append((hw.a, hw.t - result))
        }
        
        if input[2] == 1 {
            score += input[1]
            result = 0
            continue
        }
        
        stack.append((input[1], input[2]))
        result = 1
    }
}
if !stack.isEmpty {
    if stack.last?.t == result {
        score += stack.last!.a
    }
}
print(score)