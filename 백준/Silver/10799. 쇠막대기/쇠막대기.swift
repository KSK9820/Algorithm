let n = readLine()!.map { String($0) }
var stack = 0
var result = 0

var i = 0
while i < n.count - 1 {
    if n[i] == "(" && n[i+1] == ")" {
        result += stack
        i += 2
    } else if n[i] == "(" {
         stack += 1
        i += 1
    } else if n[i] == ")" {
        stack -= 1
        result += 1
        i += 1
    }
}
if n[n.count-1] == ")" && n[n.count-2] == "(" {
    print(result)
} else {
    print(result+1)
}
