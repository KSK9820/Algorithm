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
}

let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: "", count: n), count: n)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { String($0) }
}

//let my = [0,0,1,-1]
//let mx = [1, -1,0,0]
let mx = [1, 0]
let my = [0, 1]
var vmin = Array(repeating: Array(repeating: Int.max, count: n), count: n)
var vmax = Array(repeating: Array(repeating: Int.min, count: n), count: n)

var qmax = Queue<(y: Int, x: Int, n: Int, op: String?)>()
var qmin = Queue<(y: Int, x: Int, n: Int, op: String?)>()

qmax.enqueue((0,0, Int(arr[0][0])!, nil))
qmin.enqueue((0,0, Int(arr[0][0])!, nil))
vmax[0][0] = Int(arr[0][0])!
vmin[0][0] = Int(arr[0][0])!

while true {
    guard let now = qmax.dequeue() else { break }
    if now.y == n && now.x == n { break }
    for i in 0..<2 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newy >= n || newx < 0 || newx >= n { continue }
        if  ["+", "-", "*"].contains(arr[newy][newx]) {
            qmax.enqueue((newy, newx, now.n, arr[newy][newx]))
        } else {
            var v = now.n
            switch now.op {
            case "+":
                v += Int(arr[newy][newx])!
            case "-":
                v -= Int(arr[newy][newx])!
            case "*":
                v *= Int(arr[newy][newx])!
            default:
                continue
            }
            
            if v > vmax[newy][newx] {
                vmax[newy][newx] = v
                qmax.enqueue((newy, newx, v, nil))
            }
        }
    }
}
while true {
    guard let now = qmin.dequeue() else { break }
    if now.y == n && now.x == n { break }
    for i in 0..<2 {
        let newy = now.y + my[i]
        let newx = now.x + mx[i]
        
        if newy < 0 || newy >= n || newx < 0 || newx >= n { continue }
        if  ["+", "-", "*"].contains(arr[newy][newx]) {
            qmin.enqueue((newy, newx, now.n, arr[newy][newx]))
        } else {
            var v = now.n
            switch now.op {
            case "+":
                v += Int(arr[newy][newx])!
            case "-":
                v -= Int(arr[newy][newx])!
            case "*":
                v *= Int(arr[newy][newx])!
            default:
                continue
            }
            
            if v < vmin[newy][newx] {
                vmin[newy][newx] = v
                qmin.enqueue((newy, newx, v, nil))
            }
        }
    }
}

print("\(vmax[n-1][n-1]) \(vmin[n-1][n-1])")

        
