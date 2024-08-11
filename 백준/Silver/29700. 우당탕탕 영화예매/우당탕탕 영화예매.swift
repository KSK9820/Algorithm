let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var arr = Array(repeating: [Int](), count: n)
for i in 0..<n {
    //arr[i] = Array(readLine()!.map { String($0) })
    let input = Array(readLine()!.map { String($0) })
    var count = 0
    for j in input {
        if j == "0" {
            count += 1
        } else {
            if count != 0 {
                arr[i].append(count)
                count = 0
            }
        }
        
    }
    if count != 0 {
        arr[i].append(count)
    }
}

var result = 0
for i in arr {
    for j in i {
        if j >= k {
            result += (j-k) + 1
        }
    }
}
print(result)

