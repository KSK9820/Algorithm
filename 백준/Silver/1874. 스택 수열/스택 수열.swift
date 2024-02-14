
let n = Int(readLine()!)!
var result = [String]()
var stack = [Int]()
var count = 1
for _ in 0..<n {
    let a = Int(readLine()!)!
    if count < a {
        for i in count...a {
            result.append("+")
            stack.append(i)
        }
        count = a + 1
        result.append("-")
        stack.removeLast()
    } else if count == a {
        result.append("+")
        result.append("-")
        count += 1
    } else {
        if stack.removeLast() != a {
            result = ["NO"]
            break
        }
        result.append("-")
    }
}


print(result.joined(separator: "\n"))


