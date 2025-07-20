let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])


var arr = Array(repeating: Array(repeating: Int.max, count: n), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = input
}

for i in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            if arr[a][i] > 0 && arr[i][b] > 0 {
                arr[a][b] = min(arr[a][b], arr[a][i] + arr[i][b])
            }
        }
    }
}

var result = ""
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    
    if arr[a-1][b-1] <= c {
        result += "Enjoy other party\n"
    } else {
        result += "Stay here\n"
    }
}

print(result)
