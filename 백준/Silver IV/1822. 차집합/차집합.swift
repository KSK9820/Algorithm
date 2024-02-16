let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b) = (ab[0], ab[1])
var ar = readLine()!.split(separator: " ").map { Int($0)! }
var br = readLine()!.split(separator: " ").map { Int($0)! }

var seta = Set(ar)
var setb = Set(br)
let result = Array(seta.subtracting(setb)).sorted()
if result.count == 0 {
    print(0)
} else {
    print(result.count)
    print(result.map { String($0) }.joined(separator: " "))
}
