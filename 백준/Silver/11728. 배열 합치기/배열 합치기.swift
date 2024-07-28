var nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var arr = [Int]()
arr += readLine()!.split(separator: " ").map { Int($0)! }
arr += readLine()!.split(separator: " ").map { Int($0)! }
var result = ""
arr.sorted().forEach {
    result.append("\($0) ")
}
print(result)