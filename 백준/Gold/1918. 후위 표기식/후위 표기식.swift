var str = readLine()!.map { String($0) }
var num = [String]()
var op = [String]()

var result = ""
for i in str.indices {
    if !["+", "-", "*", "/", "(", ")"].contains(str[i]) {
        result += str[i]
        continue
    }
    
    if str[i] == "(" {
        op.append(str[i])
    } else if str[i] == "/" || str[i] == "*" {
        while !op.isEmpty && (op.last == "/" || op.last == "*") {
            result.append(op.removeLast())
        }
        op.append(str[i])
    } else if str[i] == "-" || str[i] == "+" {
        while !op.isEmpty && (op.last != "(") {
            result.append(op.removeLast())
        }
        op.append(str[i])
    } else if str[i] == ")" {
        while !op.isEmpty && op.last != "(" {
            result.append(op.removeLast())
        }
        _ = op.removeLast()
    }
}

while !op.isEmpty {
    result.append(op.removeLast())
}

print(result)