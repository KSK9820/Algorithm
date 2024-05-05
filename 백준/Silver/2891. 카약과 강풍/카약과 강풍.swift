let nsr = readLine()!.split(separator: " ").map { Int($0)! }
let (n,s,r) = (nsr[0], nsr[1], nsr[2])
let broken = readLine()!.split(separator: " ").map { Int($0)! }
var b = [Bool](repeating: false, count: n+1)
for i in broken {
    b[i] = true
}
let spare = readLine()!.split(separator: " ").map { Int($0)! }
var sp = [Bool](repeating: false, count: n+1)
for i in spare {
    sp[i] = true
}

var result = 0
for i in broken {
    if sp[i] {
        sp[i] = false
        continue
    }
    if i != 1 && sp[i-1] {
        sp[i-1] = false
        continue
    }
    
    if i != n && sp[i+1] && !b[i+1] {
        sp[i+1] = false
        continue
    }
    result += 1
}
print(result)

