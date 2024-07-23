let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

var leftIndex = 0
var rightIndex = n-1

var result = 0
if n == 1 {
    result = arr[0]
} else {
    if abs(arr[leftIndex]) < abs(arr[rightIndex]) {
        result += abs(arr[rightIndex])
        rightIndex -= m
    } else {
        result += abs(arr[leftIndex])
        leftIndex += m
    }
  
    while leftIndex < n && arr[leftIndex] < 0 {
        result += abs(arr[leftIndex]) * 2
        leftIndex += m
        if leftIndex >= n || arr[leftIndex] > 0 {
            break
        }
    }
    
    while rightIndex >= 0 && arr[rightIndex] > 0 {
        result += abs(arr[rightIndex]) * 2
        rightIndex -= m
        if rightIndex < 0 || arr[rightIndex] < 0 {
            break
        }
    }
}
print(result)