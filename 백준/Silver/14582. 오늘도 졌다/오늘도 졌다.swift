var j = readLine()!.split(separator: " ").map { Int($0)! }
var u = readLine()!.split(separator: " ").map { Int($0)! }
var flag = false

if j[0] != 0 {
    flag = true
}
for i in 1..<9 {
    j[i] += j[i-1]
    if j[i] > u[i-1] && flag == false {
        flag = true
    }
    u[i] += u[i-1]
}
flag ? print("Yes") : print("No")