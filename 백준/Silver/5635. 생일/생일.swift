let n = Int(readLine()!)!
var arr = [(name: String, d: Int, m: Int, y: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    arr.append((String(input[0]), Int(input[1])!, Int(input[2])!, Int(input[3])!))
}
arr = arr.sorted { $0.d < $1.d }.sorted { $0.m < $1.m }.sorted { $0.y < $1.y }
print(arr.last!.name)
print(arr[0].name)
