
struct Circle {
    var arr: [Int] = []
    var root: Int = 0
    var east: Int {
        arr[(root + 2) % 8]
    }
    var west: Int {
        arr[(root + 6) % 8]
    }
}
enum Dir {
    case cw
    case acw
    case non
}

let t = Int(readLine()!)!
var cur = [Circle](repeating: Circle(), count: t)
for i in 0..<t {
    cur[i].arr = readLine()!.map { Int(String($0))! }
}

for _ in 0..<Int(readLine()!)! {
    let nd = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,d) = (nd[0], nd[1])
    var c = [Dir](repeating: .non, count: t)
    
    c[n-1] = d == 1 ? .cw : .acw
    
    //left
    var ls = n-2
    while ls >= 0 {
        if cur[ls+1].west == cur[ls].east {
            break
        } else {
            c[ls] = c[ls+1] == .acw ? .cw : .acw
            ls -= 1
        }
    }
    //right
    var rs = n
    while rs < t {
        if cur[rs-1].east == cur[rs].west {
            break
        } else {
            c[rs] = c[rs-1] == .acw ? .cw : .acw
            rs += 1
        }
    }
    
    for i in 0..<t {
        switch c[i] {
        case .cw : cur[i].root = (cur[i].root + 7) % 8
        case .acw: cur[i].root = (cur[i].root + 1) % 8
        case .non: break
        }
    }
}
print(cur.filter { $0.arr[$0.root] == 1 }.count)

