let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
let arr = readLine()!.map { String($0) }

var result = 0
for i in 1...k {
    var visited = Array(repeating: false, count: n)
    var temp = 0
    
    for j in 0..<n where arr[j] == "P" {
        for k in -i...i where k != 0 && k+j >= 0 && k+j < n {
            if arr[k+j] == "H" && !visited[k+j] {
                visited[k+j] = true
                temp += 1
                break
            }
        }
    }
    result = max(result, temp)
}
print(result)