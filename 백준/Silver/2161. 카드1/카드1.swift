let n = Int(readLine()!)!
var arr = [Int](1...n)
var result = ""
while true {
    if arr.count == 1 { break }
    
    result += "\(arr.removeFirst()) "
    arr.append(arr.removeFirst())
    
}
print(result + "\(arr[0])")