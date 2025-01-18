let nh = readLine()!.split(separator: " ").map { Int($0)! }
let (n,h) = (nh[0], nh[1])
var t = [Int](repeating: 0, count: h)
var b = [Int](repeating: 0, count: h)
for i in 0..<n {
    let input = Int(readLine()!)! - 1
    
    if i % 2 == 0 {
        b[h-input-1] += 1
    } else {
        t[h-input-1] += 1
    }
}

for i in (1..<h) {
    t[i] += t[i-1]
    b[i] += b[i-1]
}

b = b.reversed()
var minr = Int.max
var cr = 0

for i in 0..<h {
    if t[i] + b[i] < minr {
        minr = t[i] + b[i]
        cr = 1
    } else if t[i] + b[i] == minr {
        cr += 1
    }
}
print(minr, cr)
