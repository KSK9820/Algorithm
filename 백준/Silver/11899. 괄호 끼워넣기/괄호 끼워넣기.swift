let s = readLine()!.map { String($0) }
var stack = [String]()
for i in s {
    if i == ")" && stack.last == "(" {
        _ = stack.popLast()
        continue
    } else {
        stack.append(i)
    }
}
print(stack.count)
