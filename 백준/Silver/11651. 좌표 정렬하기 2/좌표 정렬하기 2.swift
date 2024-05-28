let n = Int(readLine()!)!
var arr = [(x: Int, y: Int)]()
for i in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((xy[0], xy[1]))
}
arr = arr.sorted { $0.x < $1.x }.sorted { $0.y < $1.y }
    
var result = ""
for i in arr {
    result += "\(i.x) \(i.y)\n"
}
print(result)