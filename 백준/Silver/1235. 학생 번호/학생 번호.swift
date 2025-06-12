
let n = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    arr.append(input)
}

for i in (0..<arr[0].count).reversed() {
    var result = Set<ArraySlice<Int>>()
    for j in 0..<n {
        result.insert(arr[j][i..<arr[0].count])
    }
    if result.count == n {
        print(arr[0].count - i)
        break
    }
}
