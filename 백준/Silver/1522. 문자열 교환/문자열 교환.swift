var str = readLine()!.map { String($0) }
let n = str.count
let k = str.filter { $0 == "b" }.count

if k == 0 || k == 1 {
    print(0)
} else {
    var bCount = 0
    
    for i in 0..<k {
        bCount += str[i] == "b" ? 1: 0
    }
    
    var result = k-bCount
    for i in 1..<n {
        bCount -= str[(i - 1) % n] == "b" ? 1 : 0
        bCount += str[(i + k - 1) % n] == "b" ? 1 : 0
        result = min(result, k - bCount)
    }
       
    
    print(result)
}

