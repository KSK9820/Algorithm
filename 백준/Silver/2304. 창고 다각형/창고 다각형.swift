let n = Int(readLine()!)!
var lh = [(l: Int, h: Int)]()
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    lh.append((input[0], input[1]))
}
lh = lh.sorted { $0.l < $1.l }

var maxHeight = lh.map { $0.h }.max()!
var maxIdx = (lh.map { $0.h }.firstIndex(of: maxHeight)!, lh.map { $0.h }.lastIndex(of: maxHeight)!)

var arr1 = [(l: Int, h: Int)]()
for i in 0...maxIdx.0 {
    if arr1.isEmpty {
        arr1.append(lh[i])
    } else {
        if arr1.last!.h < lh[i].h {
            arr1.append(lh[i])
        }
    }
}

var arr2 = [(l: Int, h: Int)]()
for i in ((maxIdx.1)..<n).reversed() {
    if arr2.isEmpty {
        arr2.append(lh[i])
    } else {
        if arr2.last!.h < lh[i].h {
            arr2.append(lh[i])
        }
    }
}


var result = 0
for i in 0..<arr1.count-1 {
    result += (arr1[i+1].l - arr1[i].l) * arr1[i].h
}

if lh[maxIdx.1].l - lh[maxIdx.0].l == 0 {
    result += maxHeight
} else {
    result += (lh[maxIdx.1].l - lh[maxIdx.0].l + 1) * maxHeight
}

arr2.reverse()
for i in 1..<arr2.count {
    result += (arr2[i].l - arr2[i-1].l) * arr2[i].h
}
print(result)