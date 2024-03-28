let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n, q) = (nq[0], nq[1])

var an = [0]
an += readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

for i in 1...n {
   an[i] += an[i-1]
}

var result = [Int]()
for i in 0..<q {
    let lr = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r) = (lr[0], lr[1])
    
    result.append(an[r] - an[l-1])
}
print(result.map { String($0) }.joined(separator: "\n"))
