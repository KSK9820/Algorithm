
let string = Array(readLine()!)
let find = Array(readLine()!)

var index = 0
var length = find.count
var result = 0
while string.count - index >= length  {
    if string[index] == find[0] {
        let bef = index
        var flag = false
        for i in 1..<length {
            if string[index + i] != find[i] {
                flag = true
                break
            }
        }
        if !flag {
            result += 1
            index += length
        } else {
            index += 1
        }
    } else {
        index += 1
    }
}
print(result)
