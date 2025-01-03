var idx = 1
var answer = ""
while true {
    let input = readLine()!.map { String($0) }
    if input.contains("-") { break }
    
    var s = [String]()
    for i in input {
        if i == "{" {
            s.append("{")
        } else if i == "}" {
            if s.last == "{" {
                _ = s.popLast()
            } else {
                s.append("}")
            }
        }
    }
    
    var result = 0
    for i in s.enumerated() {
        if i.offset % 2 == 1 && i.element == "{" {
            result += 1
        } else if i.offset % 2 == 0 && i.element == "}" {
            result += 1
        }
    }
    answer.append("\(idx). \(result)\n")
    idx += 1
}
print(answer)
