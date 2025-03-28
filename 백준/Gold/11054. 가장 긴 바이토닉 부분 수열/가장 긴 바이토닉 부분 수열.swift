let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }

var up = Array(repeating: 1, count: n)
var down = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0...i {
        if a[j] < a[i] {
            up[i] = max(up[j] + 1, up[i])
        }
    }
}

for i in (0..<n).reversed() {
    for j in (i..<n).reversed() {
        if a[j] < a[i] {
            down[i] = max(down[j] + 1, down[i])
        }
    }
}

var t = up.enumerated().map { $0.element + down[$0.offset] }.max()!
print(t-1)