let nm = readLine()!.split(separator: " ").map { Int($0)! }
let h = readLine()!.split(separator: " ").map { Int($0)! }
var accumulated = [Int](repeating: 0, count: nm[0]+1)

for _ in 0..<nm[1] {
    let abk = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, k) = (abk[0]-1, abk[1], abk[2])
    accumulated[a] += k
    accumulated[b] += k * -1
    
}
for i  in 1..<nm[0] {
    accumulated[i] += accumulated[i-1]
}
let result = zip(h, accumulated).map { $0 + $1 }
print(result.map { String($0) }.joined(separator: " "))

