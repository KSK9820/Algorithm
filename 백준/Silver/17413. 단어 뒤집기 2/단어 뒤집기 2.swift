let s = readLine()!.map { String($0) }

var index = 0
var result = ""
while index < s.count {
    if s[index] == "<" {
        var temp = "<"
        index += 1
        while s[index] != ">" {
            temp.append(s[index])
            index += 1
        }
        result += temp + ">"
        index += 1
    } else if s[index] == " " {
        result += " "
        index += 1
    } else {
        var temp = ""
        while index < s.count {
            if s[index] == "<" || s[index] == " " { break }
            temp += s[index]
            index += 1
        }
        result += temp.reversed()
    }
}
print(result)
