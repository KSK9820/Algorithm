let rcq = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c,q) = (rcq[0], rcq[1], rcq[2])

var arr = Array(repeating: Array(repeating: 0, count: c+1), count: r+1)
for i in 1...r {
    arr[i] = [0] + readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 1...r {
    for j in 1...c {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}


var result = ""
for _ in 0..<q {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (r1,c1,r2,c2) = (input[0], input[1], input[2], input[3])
    
    let a =  arr[r2][c2] - arr[r1-1][c2] - arr[r2][c1-1] + arr[r1-1][c1-1]
    let b = (r2-r1+1) * (c2-c1+1)
    result.append("\(a/b)\n")
}

print(result)