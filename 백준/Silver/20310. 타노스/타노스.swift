var s = readLine()!.map { String($0) }
let zeroCount = s.filter { $0 == "0" }.count
let oneCount = s.count - zeroCount

var tempZero = 0
var tempOne = 0
for i in 0..<s.count{
    if s[i] == "1" && tempOne < (oneCount / 2) {
        s[i] = ""
        tempOne += 1
    }
}
for i in (0..<s.count).reversed() {
    if s[i] == "0" && tempZero < (zeroCount / 2) {
        s[i] = ""
        tempZero += 1
    }
}
print(s.joined())
