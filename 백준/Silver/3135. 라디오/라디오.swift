let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b) = (ab[0], ab[1])
var favorite = [Int]()
for i in 0..<Int(readLine()!)! {
    favorite.append(Int(readLine()!)!)
}

var mid = Int.max
var num = 0
for i in favorite {
    if mid >= abs(b-i) {
        mid = abs(b-i)
        num = i
    }
}
let result = min(abs(a-b), abs(b - num) + 1)
print(result)