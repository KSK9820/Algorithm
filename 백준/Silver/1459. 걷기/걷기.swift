let xyws = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y, w, s) = (xyws[0], xyws[1], xyws[2], xyws[3])
let a = (x+y) * w
let b = (x + y) % 2 == 0 ? max(x, y) * s : (max(x, y) - 1) * s + w
let c = min(x, y) * s + abs(x-y) * w
print(min(a,b,c))