let x1y1 = readLine()!.split(separator: " ").map { Float($0)! }
let x2y2 = readLine()!.split(separator: " ").map { Float($0)! }
let x3y3 = readLine()!.split(separator: " ").map { Float($0)! }

let (x1,y1) = (x1y1[0], x1y1[1])
let (x2,y2) = (x2y2[0], x2y2[1])
let (x3,y3) = (x3y3[0], x3y3[1])

let result = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)

print(result == 0 ? 0 : result < 0 ? -1 : 1)


