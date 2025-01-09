let n = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }

var sortedX = x.sorted()
var mapX = [Int: Int]()

var index = 0
for i in sortedX {
    if mapX[i] == nil {
        mapX[i] = index
        index += 1
    }
}

var result = ""
for i in x {
    result += "\(mapX[i]!) "
}
print(result)