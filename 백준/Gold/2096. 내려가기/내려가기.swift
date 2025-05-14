
let n = Int(readLine()!)!
var maxdp = [[Int]]()
var mindp = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    maxdp.append(input)
    mindp.append(input)
}


for i in 1..<n {
    maxdp[i][0] += max(maxdp[i-1][0], maxdp[i-1][1])
    maxdp[i][1] += max(maxdp[i-1][0], maxdp[i-1][1], maxdp[i-1][2])
    maxdp[i][2] += max(maxdp[i-1][1], maxdp[i-1][2])
    
    mindp[i][0] += min(mindp[i-1][0], mindp[i-1][1])
    mindp[i][1] += min(mindp[i-1][0], mindp[i-1][1], mindp[i-1][2])
    mindp[i][2] += min(mindp[i-1][1], mindp[i-1][2])
}

print(maxdp[n-1].max()!, mindp[n-1].min()!)