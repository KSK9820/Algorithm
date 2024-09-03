var n = readLine()!.map { Int(String($0))! }
var count = 0
while true {
    if n.count == 1 {
        print(count)
        if n.reduce(0, +) % 3 == 0 {
            print("YES")
        } else {
            print("NO")
        }
        break
    } else {
        count += 1
        n = String(n.reduce(0, +)).map { Int(String($0))! }
    }
}
