let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var result = [(u: Int, d: Int)](repeating: (1,1), count: n)
var up = 1
var down = 1
var answer = 1
for i in 1..<n {
    if arr[i] >= arr[i-1] {
        result[i].u = result[i-1].u + 1
        up += 1
    } else {
        up = 1
    }
    if arr[i] <= arr[i-1] {
        down += 1
    } else {
        down = 1
    }
    
    answer = max(up, down, answer)
}

print(answer)