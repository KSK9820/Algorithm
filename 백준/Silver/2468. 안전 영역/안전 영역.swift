let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)

let mx = [-1, 0, 1, 0]
let my = [0, -1, 0, 1]
var maxValue = 0
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = input
    maxValue = max(maxValue, input.max()!)
}

var result = [Int](repeating: 0, count: maxValue)
var stack = [Int]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
for t in 0..<maxValue {
    stack = []
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var alive = 0
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] > t && !visited[i][j] {
                dfs(i, j, t)
                alive += 1
            }
        }
    }
    result[t] = alive
}

print(result.max()!)

func dfs(_ y: Int, _ x: Int, _ t: Int) {
    visited[y][x] = true
    for i in 0..<4 {
        let newy = y + my[i]
        let newx = x + mx[i]
        
        if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
        
        if arr[newy][newx] > t && !visited[newy][newx] {
            visited[newy][newx] = true
            dfs(newy, newx, t)
        }
    }
}
