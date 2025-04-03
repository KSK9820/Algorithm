let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])

var ab = [Int](repeating: 0, count: n)
var bc = [Int](repeating: 0, count: n)
var ca = [Int](repeating: 0, count: n)
for i in 0..<n {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    
    ab[i] = a + b
    bc[i] = b + c
    ca[i] = c + a
}

print(max(ab.sorted(by: >)[0..<k].reduce(0, +), bc.sorted(by: >)[0..<k].reduce(0, +), ca.sorted(by: >)[0..<k].reduce(0, +)))

