let num = [Int](0...9)
let dict = ["zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight": "8", "nine":"9"]
let arr = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m,n) = (mn[0], mn[1])

var sortingAlp = [String]()
for i in m...n {
    var temp = [String]()
    
    for j in String(i).map { String($0) } {
        temp.append(arr[Int(j)!])
    }
    
    sortingAlp.append(temp.joined(separator: " "))
}

sortingAlp = sortingAlp.sorted()
var result = [Int]()

for i in sortingAlp {
    let name = i.split(separator: " ").map { dict[String($0)]! }.joined()
    
    result.append(Int(name)!)
}
var answer = ""


result.enumerated().forEach {
    if $0.offset % 10 == 0, $0.offset != 0 {
        answer += "\n"
    }
    answer += "\($0.element) "
}
print(answer)
