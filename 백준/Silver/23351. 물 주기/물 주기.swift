let nkab = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k,a,b) = (nkab[0], nkab[1], nkab[2], nkab[3])

var p = Array(repeating: k, count: n)

var result = 0
outer: while true {
    for i in 0..<n/a {
        if p.contains(0) { break outer }
        result += 1
        for j in a*i..<a*(i+1) {
            p[j] += b
        }
        p = p.map { $0 - 1 }
    }
}

print(result)