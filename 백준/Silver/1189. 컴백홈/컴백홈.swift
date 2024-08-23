let rck = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c,k) = (rck[0], rck[1], rck[2])
var arr = Array(repeating: Array(repeating: "", count: c), count: r)
for i in 0..<r {
    arr[i] = readLine()!.map { String($0) }
}

let mx = [0,0,-1,1]
let my = [1,-1,0,0]

var result = 0
var visited = Array(repeating: Array(repeating: false, count: c), count: r)

visited[r-1][0] = true
dfs(y: r-1,x: 0,count: 1)

func dfs(y: Int, x: Int, count: Int) {
    if count == k {
        if y == 0 && x == c-1 {
            result += 1
        }
        return
    }
    
    for i in 0..<4 {
        let newy = y + my[i]
        let newx = x + mx[i]
        
        if newy < 0 || newy >= r || newx < 0 || newx >= c { continue }
        if arr[newy][newx] == "T" { continue }
        if visited[newy][newx] { continue }
        
        visited[newy][newx] = true
        dfs(y: newy, x: newx, count: count+1)
        visited[newy][newx] = false
    }
}
print(result)