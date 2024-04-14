let rct = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, t) = (rct[0], rct[1], rct[2])

typealias Coord = (y: Int, x: Int)
var airClean = [Coord]()
var room = Array(repeating: Array(repeating: (dust: 0, spread: 0), count: c), count: r)

for i in 0..<r {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == -1 {
        airClean.append((i, 0))
    }
    room[i] = input.map { ($0, 0) }
}

let mx = [-1, 0, 1, 0]
let my = [0, -1, 0, 1]


for _ in 0..<t {
    
    for y in 0..<r {
        for x in 0..<c {
            if room[y][x].dust > 0 {
                let dust = room[y][x].dust / 5
                var count = 0
                for m in 0..<4 {
                    let newy = y + my[m]
                    let newx = x + mx[m]
                    
                    if newy < 0 || newx < 0 || newy >= r || newx >= c { continue }
                    if room[newy][newx].dust == -1 { continue }
                    room[newy][newx].spread += dust
                    count += 1
                }
                room[y][x].dust -= dust * count
            }
        }
    }
    
    for i in (1...airClean[0].y-1).reversed() {
        room[i][0] = (room[i-1][0].dust + room[i-1][0].spread, 0)
    }
    for i in airClean[1].y+1..<r-1 {
        room[i][0] = (room[i+1][0].dust + room[i+1][0].spread, 0)
    }
    
    for i in 0..<c-1 {
        room[0][i] = (room[0][i+1].dust + room[0][i+1].spread, 0)
        room[r-1][i] = (room[r-1][i+1].dust + room[r-1][i+1].spread, 0)
    }
    
    for i in 0..<airClean[0].y {
        room[i][c-1] = (room[i+1][c-1].dust + room[i+1][c-1].spread, 0)
    }
    for i in (airClean[1].y...r-1).reversed() {
        room[i][c-1] = (room[i-1][c-1].dust + room[i-1][c-1].spread, 0)
    }
    
    for i in (2...c-1).reversed() {
        room[airClean[0].y][i] = (room[airClean[0].y][i-1].dust + room[airClean[0].y][i-1].spread, 0)
        room[airClean[1].y][i] = (room[airClean[1].y][i-1].dust + room[airClean[1].y][i-1].spread, 0)
    }
    
    room[airClean[0].y][airClean[0].x+1] = (0, 0)
    room[airClean[1].y][airClean[1].x+1] = (0, 0)
    
    for i in 0..<r {
        room[i] = room[i].map { ($0.dust + $0.spread, 0) }
    }
}

var result = 0
for i in room {
    result += i.filter { $0.dust != -1 }.map { $0.dust + $0.spread }.reduce(0, +)
}
print(result)