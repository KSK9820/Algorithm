let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var dict = [String: String]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    dict[input[0]] = input[1]
}

var result = ""
for _ in 0..<m {
    result += "\(dict[String(readLine()!)]!)\n"
}
print(result)
