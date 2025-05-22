let n = Int(readLine()!)!
var arr = [(x: Int, y: Int)]()

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((xy[0], xy[1]))
}

if n == 2 {
    print(abs(arr[1].x - arr[0].x) + (abs(arr[1].y - arr[0].y)))
} else {
    var d = 0
    var totalD = 0
    
    for i in 1..<n {
        totalD += getD(arr[i-1], arr[i])
    }
    
    for i in 1..<n-1 {
        let d1 = getD(arr[i-1], arr[i]) + getD(arr[i], arr[i+1])
        let d2 = getD(arr[i-1], arr[i+1])
        
        d = max(d, d1-d2)
    }
    
    print(totalD - d)
}

func getD(_ p1: (x: Int, y: Int), _ p2: (x: Int, y: Int)) -> Int {
    return abs(p1.x - p2.x) + abs(p1.y - p2.y)
}
