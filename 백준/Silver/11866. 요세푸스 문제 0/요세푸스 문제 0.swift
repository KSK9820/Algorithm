let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var arr = [Int](1...n)
var result = [Int]()

var index = 0
while !arr.isEmpty {
    index = (index + k - 1) % arr.count
    result.append(arr[index])
    arr.remove(at: index)
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")
