let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
var op = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int]()

func backTracking(_ idx: Int, op: [Int], total: Int)  {
    if idx == n {
        result.append(total)
        return
    }
    
    
    if op[0] != 0 {
        var o = op
        o[0] -= 1
        backTracking(idx+1, op: o, total: total + a[idx])
    }
    if op[1] != 0 {
        var o = op
        o[1] -= 1
        backTracking(idx+1, op: o, total: total - a[idx])
    }
    if op[2] != 0 {
        var o = op
        o[2] -= 1
        backTracking(idx+1, op: o, total: total * a[idx])
    }
    if op[3] != 0 {
        var o = op
        o[3] -= 1
        backTracking(idx+1, op: o, total: total / a[idx])
    }
}
backTracking(1, op: op, total: a[0])
print(result.max()!)
print(result.min()!)
