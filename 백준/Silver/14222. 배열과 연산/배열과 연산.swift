let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
var arr = readLine()!.split(separator: " ").map { (n: Int($0)!, v: false) }
var result = Array(repeating: false, count: n+1)
result[0] = true


for i in 0..<n {
    if n < arr[i].n { continue }
    if arr[i].v { continue }
    if !result[arr[i].n] {
        result[arr[i].n] = true
        arr[i].v = true
    }
}

for i in 1...n {
    if result[i] { continue }
    
    for j in 0..<n {
        if arr[j].v { continue }
        if i - arr[j].n < 0 { continue }
        if (i - arr[j].n) % k == 0 {
            arr[j].v = true
            result[i] = true
            break
        }
    }
}

if result.contains(false) {
    print(0)
} else {
    print(1)
}