let g = Int(readLine()!)!
var result = [Int]()

var l = 1
var r = 2
while l < r {
    let w = r * r - l * l
    if w == g {
        result.append(r)
        r += 1
        continue
    }
    if r - l == 1 && w > g { break }
    if w  > g { l += 1; continue }
    r += 1    
}

if result.count == 0 {
    print(-1)
} else {
    print(result.map { String($0) }.joined(separator: "\n"))
}