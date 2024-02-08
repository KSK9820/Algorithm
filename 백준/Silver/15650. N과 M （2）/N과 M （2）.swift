let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = [Int](1...n)
var sel = [Int](repeating: 0, count: m)

func nnm(idx: Int, sidx: Int) {
    if sidx == m {
        print(sel.map{ String($0) }.joined(separator: " "))
        return
    }
    if idx == n {
        return
    }
    
    sel[sidx] = arr[idx]
    nnm(idx: idx+1, sidx: sidx+1)
    nnm(idx: idx+1, sidx: sidx)
}
nnm(idx: 0, sidx: 0)
