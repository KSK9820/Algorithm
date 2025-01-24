let s = readLine()!.map { Character(String($0)) }
var c = Array(repeating: [Character:Int](), count: s.count+1)
c[1][s[0], default: 0] += 1

for i in 1..<s.count {
    c[i+1] = c[i]
    c[i+1][s[i], default: 0] = c[i][s[i], default: 0] + 1
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let als = readLine()!.split(separator: " ").map { String($0) }
    let (a,l,r) = (Character(als[0]), Int(als[1])!, Int(als[2])!+1)
    let value = (c[r][a] ?? 0) - (c[l][a] ?? 0)
    result += "\(value)\n"
}

print(result)