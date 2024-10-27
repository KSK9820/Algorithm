let arr = readLine()!.split(separator: " ").map { Int($0)! }
var n = issigaesu(arr)
var result = 0

outer: for i in 1...9 {
    for j in 1...9 {
        for k in 1...9 {
            for l in 1...9 {
                let num = i * 1000 + j * 100 + k * 10 + l
                
                if issigaesu([i,j,k,l]) == num {
                    result += 1
                }
                
                if num == n { break outer }
            }
        }
    }
}
func issigaesu(_ arr: [Int]) -> Int {
    var result = Int.max
    for i in 0..<4 {
        let tmp = arr[i] * 1000 + arr[(i+1)%4] * 100 + arr[(i+2)%4] * 10 + arr[(i+3)%4]
        result = min(tmp, result)
    }
    return result
}

print(result)
