
let n = Int(readLine()!)!
var arr = [String]()
for _ in 0..<n {
    arr.append(readLine()!)
}
arr = arr.sorted()

var result = 0

for i in 0..<n-1 {
    for j in (i+1)..<n {
        let str1 = check(arr[i])
        let str2 = check(arr[j])
        
        if str1 == str2 { result += 1}
    }
}


func check(_ str: String) -> [Int] {
    var result = [Int]()
    var idx = [String: Int]()
    
    let s = str.map { String($0) }
    for i in s {
        if idx[i] == nil {
            idx[i] = idx.count + 1
        }
        result.append(idx[i]!)
    }
    
    return result
}

print(result)
