let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: Int.max, count: n), count: n)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0]-1, abc[1]-1, abc[2])
    if arr[a][b] > c {
        arr[a][b] = c
    }
}

for i in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            if a == b || b == i || i == a { continue }
            if arr[a][i] == Int.max || arr[i][b] == Int.max { continue }
            arr[a][b] = min(arr[a][b], arr[a][i] + arr[i][b])
        }
    }
}

for i in 0..<n {
    print(arr[i].map { $0 == Int.max ? "0" : String($0) }.joined(separator: " "))
}