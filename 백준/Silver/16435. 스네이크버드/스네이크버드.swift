let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n,l) = (nl[0], nl[1])
let h = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

var result = l
for i in h {
    if result >= i {
        result += 1
    } else { break }
}
print(result)