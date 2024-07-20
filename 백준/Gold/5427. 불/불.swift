struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
    
    mutating func empty() {
        output = [T]()
        input = [T]()
    }
}


let mx = [0,0,1,-1]
let my = [1,-1,0,0]

for _ in 0..<Int(readLine()!)! {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, h) = (wh[0], wh[1])
    var arr = Array(repeating: Array(repeating: ("", 0), count: w), count: h)
    var sanggen = (y: 0, x: 0)
    var fire: [(y: Int, x: Int)] = []
    
    for i in 0..<h {
        arr[i] = readLine()!.map { (String($0),0) }
        for j in 0..<w {
            if arr[i][j].0 == "@" {
                sanggen = (i,j)
            }
            if arr[i][j].0 == "*" {
                fire.append((i,j))
            }
        }
    }
    
    var fq = Queue<(y: Int, x: Int, c: Int)>()
    for i in fire {
        fq.enqueue((i.y, i.x, 0))
    }
    var newq = Queue<(y: Int, x: Int, c: Int)>()
    func makeFire() {
        while true {
            guard let f = fq.dequeue() else {
                fq = newq
                newq.empty()
                break
            }
            
            for i in 0..<4 {
                let newy = f.y + my[i]
                let newx = f.x + mx[i]
                
                if newy < 0 || newy >= h || newx < 0 || newx >= w {
                    continue
                }
                if arr[newy][newx].0 == "." || arr[newy][newx].0 == "@" {
                    arr[newy][newx] = ("*", f.c+1)
                    newq.enqueue((newy, newx, f.c+1))
                }
            }
        }
    }
    
    var q = Queue<(y: Int, x: Int, c: Int)>()
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    q.enqueue((sanggen.y, sanggen.x, 0))
    
outer: while true {
    makeFire()
    guard let s = q.dequeue() else {
        print("IMPOSSIBLE")
        break
    }
   
    if s.y == 0 || s.x == 0 || s.y == h-1 || s.x == w-1 {
        print(s.c + 1)
        break
    }
    
    for i in 0..<4 {
        let newy = s.y + my[i]
        let newx = s.x + mx[i]
        
        if newy < 0 || newy >= h || newx < 0 || newx >= w {
            continue
        }
        
        if arr[newy][newx].0 == "*" && arr[newy][newx].1 <= s.c + 1 { continue }
        if arr[newy][newx].0 == "#" { continue }
        if visited[newy][newx] { continue }
        q.enqueue((newy, newx, s.c + 1))
        visited[newy][newx] = true
        arr[newy][newx] = ("@", s.c + 1)
    }
}
    
}



