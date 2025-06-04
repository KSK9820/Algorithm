
let n = Int(readLine()!)!
let s = readLine()!.split(separator: " ").map { Int($0)! }

if n == 1 {
    print(1)
} else {
    var l = 0
    var r = 0

    var fruit = [Int:Int]()
    var result = 0
    while l < n && r < n && l <= r {
        if fruit.count <= 2 {
            fruit[s[r], default: 0] += 1
            r += 1
        } else {
            fruit[s[l], default: 0] -= 1
            if fruit[s[l]] == 0 {
                fruit[s[l]] = nil
            }
            l += 1
        }
        if fruit.count <= 2 {
            result = max(result, fruit.values.reduce(0, +))
        }
    }
    
    print(result)
}
