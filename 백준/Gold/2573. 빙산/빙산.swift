let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

var ice = [[(h: Int, when: Int)]](repeating: [], count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n {
    ice[i] = readLine()!.split(separator: " ").map { (Int($0)!, 0) }
}
var year = 1
var melt = false

while !melt {
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    melt = true
    var iceberg = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if ice[i][j].h != 0 && !visited[i][j] {
                dfs(i, j)
                melt = false
            }
        }
    }

    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            if ice[i][j].h != 0 && !visited[i][j] {
                checkDFS(i, j)
                iceberg += 1
            }
        }
    }
   
    if iceberg >= 2 {
        break
    }
    year += 1
}
if melt == true {
    print("0")
} else {
    print(year)
}


//dfs
func dfs(_ y: Int, _ x: Int) {
    if visited[y][x] == true { return }
    if ice[y][x].h == 0 { return }
    visited[y][x] = true
    
    for i in 0..<4 {
        let newx = x + dx[i]
        let newy = y + dy[i]
        
        if newx < 0 || newx >= m || newy < 0 || newy >= n { continue }
        if visited[newy][newx] == true { continue }
        if ice[newy][newx].h == 0 && ice[newy][newx].when != year {
            if ice[y][x].h == 0  { continue }
            
            ice[y][x].h -= 1
            if ice[y][x].h == 0 {
                ice[y][x].when = year
            }
        }
        if ice[newy][newx].h != 0 {
            dfs(newy, newx)
        }
    }
}

func checkDFS(_ y: Int, _ x: Int) {
    if visited[y][x] ==  true { return }
    if ice[y][x].h == 0 { return }
    visited[y][x] = true
    
    for i in 0..<4 {
        let newx = x + dx[i]
        let newy = y + dy[i]
        
        if newx < 0 || newx >= m || newy < 0 || newy >= n { continue }
        if visited[newy][newx] == true { continue }
        if ice[newy][newx].h != 0 {
            checkDFS(newy, newx)
        }
    }
}
