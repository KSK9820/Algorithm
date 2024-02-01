let t = Int(readLine()!)!
let mx = [1, 0, -1, 0]
let my = [0, 1, 0, -1]

for _ in 0..<t {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, k) = (mnk[0], mnk[1], mnk[2])
    
    var count = 0
    var bachu = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    for _ in 0..<k {
        let xy = readLine()!.split(separator: " ").map { Int($0)! }
        let (x, y) = (xy[0], xy[1])
        bachu[y][x] = 1
    }
    
    func dfs(_ y: Int, _ x: Int) {
        for i in 0..<4 {
            let newY = y + my[i]
            let newX = x + mx[i]
            
            if !(0..<n).contains(newY) || !(0..<m).contains(newX) { continue }
            if bachu[newY][newX] == 1 && !isVisited[newY][newX] {
                isVisited[newY][newX] = true
                dfs(newY, newX)
            }
        }
    }
    
    for y in 0..<n {
        for x in 0..<m {
            if bachu[y][x] == 1 && !isVisited[y][x] {
                isVisited[y][x] = true
                count += 1
                dfs(y, x)
            }
        }
    }
    
    
    
    print(count)
}