let n = Int(readLine()!)!
var arr = [(x: Int, y: Int)]()

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
    arr.append((xy[0], xy[1]))
}

var result = 0
var last = arr[0]
if n == 1 {
    result = arr[0].y - arr[0].x
} else {
    for i in 1..<n {
        if last.y < arr[i].x {
            result += last.y - last.x
            last = arr[i]
        } else {
            if last.y < arr[i].y {
                last.y = arr[i].y
            }
        }
        
        if i == n-1 {
            result += last.y - last.x
        }
    }
}
print(result)
