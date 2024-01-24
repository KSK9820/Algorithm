while true {
    let input = readLine()!
    if input == "." { break }
    
    var open = [Character]()
    var openCount = 0
    var closeCount = 0
    var result = "yes"
    
    for i in input {
        if ["[", "("].contains(String(i)) {
            open.append(i)
            openCount += 1
        } else if ["]", ")"].contains(String(i)) {
            closeCount += 1
            if String(i) == "]" && open.last != "[" {
                result = "no"
                break
            }
            else if String(i) == ")" && open.last != "(" {
                result = "no"
                break
            }
            open.removeLast()
        }
    }
    if openCount != closeCount {
        result = "no"
    }
    print(result)
}