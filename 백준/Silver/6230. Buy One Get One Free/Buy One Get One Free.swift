let nm = readLine()!.split(separator: " ").map { Int($0)! }
var narr = [Int](repeating: 0, count: nm[0])
var marr = [Int](repeating: 0, count: nm[1])
for i in 0..<nm[0] {
    narr[i] = Int(readLine()!)!
}
for i in 0..<nm[1] {
    marr[i] = Int(readLine()!)!
}
narr.sort()
marr.sort()
var m = 0
var result = 0
for n in narr {
    if m < marr.count && n > marr[m] {  // 범위 체크 추가
        result += 2
        m += 1
    } else {
        result += 1
    }
}
print(result)