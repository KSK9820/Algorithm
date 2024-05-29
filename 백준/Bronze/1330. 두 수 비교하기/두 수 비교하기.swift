
let ab = readLine()!.split(separator: " ").map { Int($0)! }
if ab[0] < ab[1] {
    print("<")
} else if ab[0] > ab[1] {
    print(">")
} else {
    print("==")
}