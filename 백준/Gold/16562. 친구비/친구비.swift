let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])
var fee = readLine()!.split(separator: " ").map { Int($0)! }
var friend = [Int](0...n)

for i in 0..<m {
    let vw = readLine()!.split(separator: " ").map { Int($0)! }
    union(vw[0], vw[1])
}
var root = [Int]()
for i in 1...n {
    root.append(find(i))
}

root = Array(Set(root))
var count = root.enumerated().map { fee[$0.element - 1] }.reduce(0, +)
count > k ? print("Oh no") : print(count)

func find(_ index: Int) -> Int {
    if friend[index] != index {
        friend[index] = find(friend[index])
    }
    return friend[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if fee[aP-1] > fee[bP-1] {
        friend[aP] = bP
    } else {
        friend[bP] = aP
    }
}