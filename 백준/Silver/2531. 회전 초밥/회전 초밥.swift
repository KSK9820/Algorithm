let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n,d,k,c) = (input[0], input[1], input[2], input[3])

var s = [Int]()
for _ in 0..<n {
    s.append(Int(readLine()!)!)
}

s += s
s += s

var count = [Int:Int]()
for i in (n-k)...n-1 {
    count[s[i], default: 0] += 1
}
var result = count.count

for i in (n-k+1)...2*n {
    count[s[i-1]]! -= 1
    count[s[i+k-1], default: 0] += 1
    if count[s[i-1]] == 0 {
        count[s[i-1]] = nil 
    }
    count[c] = 1
    result = max(result, count.count)
}

print(result)
