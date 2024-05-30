var n = readLine()!.map { Int(String($0))! }
n.sort(by: >)
print(n.map { String($0) }.joined())
