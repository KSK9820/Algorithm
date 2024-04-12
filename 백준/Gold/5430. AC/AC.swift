import Foundation

let t = Int(readLine()!)!
var result = ""
for _ in 0..<t {
    let p = Array(readLine()!)
    let n = Int(readLine()!)!
    let arr = readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "[]")).split(separator: ",").map { Int($0)! }
    
    if p.filter { $0 == "D" }.count > n {
        result.append("error\n")
        continue
    }
    
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
    }
    
    if startIndex < lastIndex {
        var newArr = ""
        if direction {
            newArr = "\(arr[startIndex..<lastIndex])".replacingOccurrences(of: ", ", with: ",")
        } else {
            newArr = "\(Array(arr[startIndex..<lastIndex].reversed()))".replacingOccurrences(of: ", ", with: ",")
        }
        result.append(newArr + "\n")
    } else if startIndex == lastIndex {
        result.append("[]\n")
    }
}
print(result)
