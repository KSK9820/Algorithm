let n = readLine()!.map { Int(String($0))! }
var value = 1
var idx = 0

while idx < n.count {
    for c in String(value) where idx < n.count {
        if String(c) == String(n[idx]) {
            idx += 1
        }
    }
    value += 1
}
print(value-1)

