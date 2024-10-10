let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n,l) = (nl[0], nl[1])

var result = 0
var before = 0
for _ in 0..<n {
    let drg = readLine()!.split(separator: " ").map { Int($0)! }
    result += (drg[0] - before)
    before = drg[0]
    
    let now = result % (drg[1]+drg[2])
    if drg[1] >= now {
        result += (drg[1]-now)
    }
}

print(result+(l-before))
