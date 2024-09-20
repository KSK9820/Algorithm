let s = readLine()!
let t = readLine()!
var stack = [String]()
var result = 0

stack.append(t)
while true {
    guard let str = stack.popLast() else { break }
    if str == s { result = 1; break }
    
    if str.first == "B" {
        var str1 = String(str.reversed())
        str1.popLast()
        stack.append(str1)
    }
    if str.last == "A" {
        var str2 = str
        str2.popLast()
        stack.append(str2)
    }

}
print(result)
