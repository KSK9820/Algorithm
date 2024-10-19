let nmb = readLine()!.split(separator: " ").map { Int($0)! }
var (n,m, b) = (nmb[0], nmb[1], nmb[2])

var arr = [[Int]]()
var minSize = Int.max
var maxSize = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(input)
    minSize = min(minSize, input.min()!)
    maxSize = max(maxSize, input.max()!)
}

var result = Int.max
var resultSize = 0
for size in minSize...maxSize {
    var del = 0 // 2
    var add = 0 // 1
    
    for y in 0..<n {
        for x in 0..<m {
            if arr[y][x] < size {
                add += size - arr[y][x]
            } else {
                del += arr[y][x] - size
            }
        }
    }
    
    if add > del + b { continue }
    if result >= add + del * 2 {
        result = add + del * 2
        resultSize = size
    }
}
print(result, resultSize)