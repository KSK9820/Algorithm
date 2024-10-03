var s = Int(readLine()!)!
var result = 0
var idx = 1
while s >= idx {
    s -= idx
    result += 1
    idx += 1
}
print(result)