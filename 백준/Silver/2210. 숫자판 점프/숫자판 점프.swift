var arr = [[String]]()
for i in 0..<5 {
    arr.append(readLine()!.split(separator: " ").map { String($0) })
}

let mx = [0,0,-1,1]
let my = [-1,1,0,0]

var result = Set<String>()
for y in 0..<5 {
    for x in 0..<5 {
        var s = [(y: Int, x: Int, n: [String])]()
        s.append((y, x, [arr[y][x]]))
        
        while true {
            guard let now = s.popLast() else { break }
            if now.n.count == 6 {
                result.insert(now.n.joined())
                continue
            }
            
            for i in 0..<4 {
                let newy = now.y + my[i]
                let newx = now.x + mx[i]
                
                if newy < 0 || newy >= 5 || newx < 0 || newx >= 5 { continue }
                s.append((newy, newx, now.n + [arr[newy][newx]]))
            }
        }
    }
}
print(result.count)
