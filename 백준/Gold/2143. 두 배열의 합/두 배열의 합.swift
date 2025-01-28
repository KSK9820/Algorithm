let t = Int(readLine()!)!
let n = Int(readLine()!)!
var a = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var b = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for i in 1...n {
    a[i] += a[i-1]
}
for i in 1...m {
    b[i] += b[i-1]
}

var ahap = [Int:Int]()
for i in 0...n {
    for j in 0..<i {
        let v = a[i] - a[j]
        ahap[v, default: 0] += 1
    }
}

var bhap = [Int: Int]()
for i in 0...m {
    for j in 0..<i {
        let v = b[i] - b[j]
        bhap[v, default: 0] += 1
    }
}

var result = 0
for i in ahap {
    if let v = bhap[t-i.key] {
        result += i.value * v
    }
}


print(result)

