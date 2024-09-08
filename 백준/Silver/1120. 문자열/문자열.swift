let ab = readLine()!.split(separator: " ")
let a = ab[0].map { String($0) }
let b = ab[1].map { String($0) }

var result = Int.max
for i in 0...b.count - a.count{
    var size = 0
    for j in 0..<a.count {
        if a[j] != b[i+j] {
            size += 1
        }
    }
    result = min(result, size)
}
print(result)