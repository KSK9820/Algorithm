let dk = readLine()!.split(separator: " ").map { Int($0)! }
let (d,k) = (dk[0], dk[1])

var a = [1,0]
var b = [0,1]
for i in 2..<d {
    a.append(a[i-1] + a[i-2])
    b.append(b[i-1] + b[i-2])
}

let A = a.last!
let B = b.last!
for i in 1..<k/a.last! {
    if (k - (A * i)) % B == 0 {
        print(i)
        print((k - (A * i)) / B)
        break
    }
}

