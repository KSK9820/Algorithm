
let xy = readLine()!.split(separator: " ").map { Int($0)! }
let n = Int(readLine()!)!

var hor = [0, xy[0]]
var ver = [0, xy[1]]
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == 0 {
        ver.append(input[1])
    } else {
        hor.append(input[1])
    }
}

hor.sort()
ver.sort()

var width = [Int]()
var height = [Int]()

for i in 1..<hor.count {
    width.append(hor[i] - hor[i-1])
}
for i in 1..<ver.count {
    height.append(ver[i] - ver[i-1])
}

var result = 0
for i in width {
    for j in height {
        result = max(i * j, result)
    }
}
print(result)
