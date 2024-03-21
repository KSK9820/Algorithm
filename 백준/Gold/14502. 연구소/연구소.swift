let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

var queue = Queue<(y: Int, x: Int)>()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = input
    for j in 0..<m {
        if input[j] == 2 {
            queue.enqueue((i,j))
        }
    }
}
var q = queue

let mx = [-1, 0, 1, 0]
let my = [0, 1, 0, -1]
var result = 0

for i in 0..<n*m-2 {
    if arr[i/m][i%m] != 0 { continue }
    
    for j in (i+1)..<n*m-1 {
        if arr[j/m][j%m] != 0 { continue }
        
        for k in (j+1)..<n*m {
            if arr[k/m][k%m] != 0 { continue }
            
            var map = arr
            q = queue
            visited = Array(repeating: Array(repeating: false, count: m), count: n)
            
            map[i/m][i%m] = 1
            map[j/m][j%m] = 1
            map[k/m][k%m] = 1
           
            bfs(map: &map)
            result = max(result, map.joined().filter { $0 == 0 }.count)
        }
    }
}
print(result)


func bfs(map: inout [[Int]]) {
    while true {
        guard let virus = q.dequeue() else { break }
        if visited[virus.y][virus.x] == true { continue }
        visited[virus.y][virus.x] = true

        for i in 0..<4 {
            let newy = virus.y + my[i]
            let newx = virus.x + mx[i]
            
            if newy < 0 || newy >= n || newx < 0 || newx >= m { continue }
            if map[newy][newx] == 0 {
                map[newy][newx] = 2
                q.enqueue((newy, newx))
            }
        }
    }
}



struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}
