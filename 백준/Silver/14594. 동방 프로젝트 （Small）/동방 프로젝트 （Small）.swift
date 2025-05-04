
var n = Int(readLine()!)!
var wall = Array(repeating: 0, count: n+1)

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    for i in xy[0]..<xy[1] {
        wall[i] = 1
    }
}

wall.removeFirst()
wall.removeLast()
print(wall.filter { $0 == 0 }.count + 1)
