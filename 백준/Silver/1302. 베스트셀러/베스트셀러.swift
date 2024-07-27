let n = Int(readLine()!)!
var dic = [String:Int]()
for i in 0..<n {
    let book = readLine()!
    if (dic[book] != nil) {
        dic[book]! += 1
    } else {
        dic[book] = 1
    }
}
print(dic.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    }
    return $0.value > $1.value
}.first!.key)
