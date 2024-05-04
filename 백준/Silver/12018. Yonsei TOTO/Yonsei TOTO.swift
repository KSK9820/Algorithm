let nm = readLine()!.split(separator: " ").map { Int($0)! }
var (n,m) = (nm[0], nm[1])
var arr = [(p: Int, l: Int)]()
var mile = [[Int]]()
var result = 0
for _ in 0..<n {
    let pl = readLine()!.split(separator: " ").map { Int($0)! }
    if pl[0] < pl[1] {
        if m > 0 {
            m -= 1
            result += 1
        }
        readLine()
    } else {
        arr.append((pl[0], pl[1]))
        mile.append(readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >))
    }
}

var subject = [Int]()
for i in 0..<mile.count {
    subject.append(mile[i][arr[i].l-1])
}
subject = subject.sorted()

for i in subject {
    if m >= i {
        m -= i
        result += 1
    } else { break }
}

print(result)

