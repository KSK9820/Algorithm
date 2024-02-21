let n = Int(readLine()!)!
var homework = [(duration: Int, due: Int)]()

for _ in 0..<n {
    let dt = readLine()!.split(separator: " ").map { Int($0)! }
    homework.append((dt[0], dt[1]))
}
homework = homework.sorted { $0.due > $1.due }
var result = homework.first!.due
for i in homework {
    if result < i.due {
        result -= i.duration
    } else {
        result = i.due - i.duration
    }
}
print(result)
