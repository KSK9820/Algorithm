let n = Int(readLine()!)!
var h = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    h[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

typealias coords = (y: Int, x: Int, s: dir)
enum dir: Int {
    case hor = 0
    case ver = 1
    case dia = 2
    case none = 3
}

var q = [coords]()
q.append((0, 1, .hor))

var hor: [coords] = [(0,1,.hor), (1,1, .dia)]
var ver: [coords] = [(1,0,.ver), (1,1,.dia)]
var dia: [coords] = [(0,1,.hor), (1,0, .ver), (1,1, .dia)]

var result = 0

while true {
    guard let now = q.popLast() else { break }
    if now.y == n-1 && now.x == n-1 { result += 1; continue }
    
    var nDir = hor
    switch now.s {
    case .hor:
        nDir = hor
    case .ver:
        nDir = ver
    case .dia:
        nDir = dia
    case .none:
        break
    }
    
    for i in nDir {
        let newy = now.y + i.y
        let newx = now.x + i.x
        
        if newy < 0 || newx < 0 || newy >= n || newx >= n { continue }
        if h[newy][newx] == 1 { continue }
        
        if i.s == .dia {
            if h[now.y + 1][now.x] == 0 && h[now.y][now.x+1] == 0 {
                q.append((newy, newx, i.s))
            }
        } else {
            q.append((newy, newx, i.s))
        }
    }

}
print(result)
