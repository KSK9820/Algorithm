let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var dot = [Int](0..<n)

var count = 0
for i in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = find(input[0])
    let end = find(input[1])
    
    if start == end {
        count = i + 1
        break
    }
    union(input[0], input[1])
    
}
print(count)

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)

    if aP == bP { return }
    dot[max(aP,bP)] = min(aP,bP)
}

func find(_ index: Int) -> Int {
    if dot[index] != index {
        dot[index] = find(dot[index])
    }
    return dot[index]
}
