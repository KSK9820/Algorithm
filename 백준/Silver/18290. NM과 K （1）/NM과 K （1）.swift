
typealias coord = (y: Int, x: Int)

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var result = Int.min


if k == 1 {
    result = arr.flatMap { $0 }.max()!
} else {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var selected = [coord]()
    dfs(0)
    
    func dfs(_ start: Int) {
        if selected.count == k {
            result = max(result, selected.map { arr[$0.y][$0.x] }.reduce(0, +))
            return
        }
        
        for idx in start..<n*m {
            let newy = idx / m
            let newx = idx % m
            
            if newx < 0 || newx >= m || newy < 0 || newy >= n { continue }
            if visited[newy][newx] { continue }
            if chcekNearby((newy, newx)) {
                visited[newy][newx] = true
                selected.append((newy, newx))
                dfs(idx + 1)
                selected.removeLast()
                visited[newy][newx] = false
            }
        }
    }
    
    func chcekNearby(_ c: coord) -> Bool {
        let dir: [coord] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        for i in 0..<dir.count {
            let newx = c.x + dir[i].x
            let newy = c.y + dir[i].y
            
            if newx < 0 || newx >= m || newy < 0 || newy >= n { continue }
            if visited[newy][newx] { return false }
        }
        
        return true
    }

}
print(result)