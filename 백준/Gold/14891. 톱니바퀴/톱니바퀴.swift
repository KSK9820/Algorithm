import Foundation

var t = [[Int]]()
for _ in 0..<4 {
    t.append(readLine()!.map { Int(String($0))! })
}
let k = Int(readLine()!)!

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, dir) = (input[0]-1, input[1] == 1 ? true : false)
    var newt = t
    if dir {
        newt[n].insert(newt[n].removeLast(), at: 0)
    } else {
        newt[n].append(newt[n].removeFirst())
    }
    
    var leftDir = !dir

    for left in (0..<n).reversed() {
        if t[left][2] != t[left+1][6] {
            if leftDir {
                newt[left].insert(newt[left].removeLast(), at: 0)
            } else {
                newt[left].append(newt[left].removeFirst())
            }
            leftDir.toggle()
           
        } else { break }
    }
    
    var rightDir = !dir
    for right in (n+1)..<4 {
        if t[right-1][2] != t[right][6] {
            if rightDir {
                newt[right].insert(newt[right].removeLast(), at: 0)
            } else {
                newt[right].append(newt[right].removeFirst())
            }
            rightDir.toggle()
        } else { break }
    }
    t = newt
  
}


var point = 0
for i in 0..<4 {
    if t[i][0] == 1 { point += Int(pow(2.0, Float(i))) }
}
print(point)

