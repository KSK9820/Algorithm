let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var stack = [(y: Int, x: Int)]()
var campus = Array(repeating: Array(repeating: "", count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    for j in 0..<m {
        if input[j] == "I" {
            stack.append((i,j))
        }
    }
    campus[i] = input
}

let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]
var result = 0
while true {
    guard let pop = stack.popLast() else { break }
    if visited[pop.y][pop.x] == true { continue }
    visited[pop.y][pop.x] = true
    if campus[pop.y][pop.x] == "P" { result += 1 }
    for i in 0..<4 {
        let newX = pop.x + dx[i]
        let newY = pop.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if visited[newY][newX] == false && campus[newY][newX] == "O" || campus[newY][newX] == "P" {
            stack.append((newY, newX))
        }
    }
}
result == 0 ? print("TT") : print(result)