let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = [0] + readLine()!.split(separator: " ").map { Int($0)! % m }

for i in 1...n {
    arr[i] = (arr[i-1] + arr[i]) % m
}

var dict = [Int:Int]()
for i in arr {
    dict[i, default: 0] += 1
}
var result = 0
dict.map {
    if $0.value > 1 {
        result += $0.value * ($0.value-1) / 2
    }
}
  
print(result)
