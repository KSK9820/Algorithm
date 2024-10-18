let n = Int(readLine()!)!

var selected = [Int](repeating: -1, count: n)
var num = [1,5,10,50]
var result = Set<Int>()

func backTracking(idx: Int) {
    
    if idx == n {
        result.insert(selected.reduce(0, +))
        return
    }
    
    for i in 0..<4 {
        if idx > 0 && selected[idx-1] > num[i] { continue }
        selected[idx] = num[i]
        backTracking(idx: idx + 1)
    }
}

backTracking(idx: 0)
print(result.count)