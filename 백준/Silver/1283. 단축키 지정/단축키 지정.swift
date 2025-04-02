import Foundation

let t = Int(readLine()!)!
var words: [String] = []
for _ in 0..<t {
    words.append(readLine()!)
}

var short = Set<String>()
var result = ""
for i in words {
    var a = i.split(separator: " ")
    let big = a.map { String($0).first! }
    var flag = true
    for j in big.enumerated() {
        if !short.contains(String(j.element).uppercased()) {
            short.insert(j.element.uppercased())
            flag = false
            var str = ""
            for k in 0..<a.count {
                if k == j.offset {
                    if let range = a[k].range(of: String(j.element)) {
                        a[k].replaceSubrange(range, with: "[\(j.element)]")
                    }
                }
                str += "\(a[k]) "
            }
            result += "\(str)\n"
            
            break
        }
    }
    
    if flag {
        var flag1 = true
        for j in i {
            if !short.contains(j.uppercased()) && j != " " {
                short.insert(j.uppercased())
                let arr = i.map { String($0) }
                let keyIndex = arr.firstIndex(of: String(j))!
                for k in 0..<arr.count {
                    if k == keyIndex {
                        result.append("[\(j)]")
                    } else {
                        result.append(arr[k])
                    }
                }
                result.append("\n")
                flag1 = false
                break
            }
        }
        if flag1 {
            result.append(i)
            result.append("\n")
        }
    }
}

print(result)
