let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n,l,r,x) = (input[0], input[1], input[2], input[3])
let level = readLine()!.split(separator: " ").map { Int($0)! }
var selected = [Int]()
var check = Array(repeating: false, count: n)

var result = 0

func backTracking(idx: Int, lidx: Int) {
    if selected.count >= 2 {
        let hap = selected.reduce(0, +)
        if hap >= l && hap <= r {
            let temp  = selected.filter { $0 != 0 }
            if temp.max()! - temp.min()! >= x {
                result += 1
            }
        }
    }

    if idx == n {
        return
    }
    
    for i in lidx+1..<n {
        if !check[i] {
            check[i] = true
            selected.append(level[i])
            backTracking(idx: idx+1, lidx: i)
            check[i] = false
            selected.popLast()
        }
    }
}

backTracking(idx: 0, lidx: -1)
print(result)
