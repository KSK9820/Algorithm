
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var war = Array(repeating: [String](), count: m)
for i in 0..<m {
    war[i] = readLine()!.map { String($0) }
}

var stack = [(y: Int, x: Int)]()
var visited = Array(repeating: Array(repeating: Int.max, count: n), count: m)
let mx = [0, -1, 1, 0]
let my = [1, 0, 0, -1]

var result = ["W":[Int](), "B":[Int]()]

func dfs(_ team: String) {
    for y in 0..<m {
        for x in 0..<n {
            if war[y][x] == team {
                if visited[y][x] == Int.max {
                    stack.append((y, x))
                    var count = 1
                    visited[y][x] = count
                    while true {
                        guard let now = stack.popLast() else {
                            result[team]?.append(count)
                            break
                        }
                        
                        
                        for i in 0...3 {
                            let newx = now.x + mx[i]
                            let newy = now.y + my[i]
                            
                            if newx < 0 || newx >= n || newy < 0 || newy >= m { continue }
                            if war[newy][newx] != team { continue }
                            if visited[newy][newx] < count + 1 { continue }
                            
                            count += 1
                            visited[newy][newx] = count
                            stack.append((newy, newx))
                        }
                    }
                }
            }
        }
    }
}

dfs("W")
dfs("B")
print("\(result["W"]!.map { $0 * $0 }.reduce(0, +)) \(result["B"]!.map { $0 * $0 }.reduce(0, +))")

