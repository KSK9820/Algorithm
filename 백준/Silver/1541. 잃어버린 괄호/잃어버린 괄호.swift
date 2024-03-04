import Foundation
let splitPlus = readLine()!.components(separatedBy: "+")
var arr = [String]()
for (idx, comp) in splitPlus.enumerated() {
    let splitMinus = comp.components(separatedBy: "-")
    for (i, part) in splitMinus.enumerated() {
        if let digit = Int(part) {
            arr.append(String(digit))
        }
        if i < splitMinus.count - 1 {
            arr.append("-")
        }
    }
    if idx < splitPlus.count - 1{
        arr.append("+")
    }
}

var minValue = 0
var i = 0

while i < arr.count {
    var temp = 0
    if let num = Int(arr[i]) {
        minValue += num
        i += 1
        continue
    } else if arr[i] == "+" {
        i += 1
        continue
    } else if arr[i] == "-" {
        i += 1
        
        while i < arr.count  && arr[i] != "-" {
            if i >= arr.count { break }
            if let num = Int(arr[i]) {
                temp += num
            }
            i += 1
        }
        minValue -= temp
    }
}

print(minValue)