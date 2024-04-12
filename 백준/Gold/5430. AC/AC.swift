import Foundation

let t = Int(readLine()!)!
var result = ""
for _ in 0..<t {
    let p = Array(readLine()!)
    let n = Int(readLine()!)!
    let arr = readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "[]")).split(separator: ",")
    
    var startIndex = 0
    var lastIndex = n
    var direction = true
    
    for op in p {
        if op == "R" {
            direction.toggle()
            continue
        }
        if op == "D" {
           
            if direction {
                startIndex += 1
            } else {
                lastIndex -= 1
            }
        } 
        if startIndex > lastIndex {
            result.append("error\n")
            break
        }
    }
    
    if startIndex < lastIndex {
        var newArr = ""
        if direction {
            newArr = arr[startIndex..<lastIndex].joined(separator: ",")
        } else {
            newArr = Array(arr[startIndex..<lastIndex].reversed()).joined(separator: ",")
        }
        result.append("[" + newArr + "]" + "\n")
    } else if startIndex == lastIndex {
        result.append("[]\n")
    }
}
print(result)