let n = Int(readLine()!)!
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    array[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var selected = Array(repeating: 0, count: n/2)
var result = Int.max

func backTracking(idx: Int, sidx: Int) {
    if sidx == n / 2 {
        let start = teamPower(arr: selected)
        let linkMember = Array(Set(1...n).subtracting(Set(selected)))
        let link = teamPower(arr: linkMember)
        result = min(abs(start - link), result)
        return
    }
    
    if idx == n {
        return
    }
    
    selected[sidx] = idx
    backTracking(idx: idx+1, sidx: sidx+1)
    backTracking(idx: idx+1, sidx: sidx)
}


func teamPower(arr: [Int]) -> Int {
    var result = 0
    for i in arr {
        for j in arr where i != j{
            result += array[i-1][j-1]
        }
    }
    return result
}

backTracking(idx: 1, sidx: 0)
print(result)