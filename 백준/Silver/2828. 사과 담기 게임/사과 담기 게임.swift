import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
let j = Int(readLine()!)!

var p = (s: 1, e: m)
var result = 0

for _ in 0..<j {
    let apple = Int(readLine()!)!

    if p.s <= apple && p.e >= apple { continue }
    
    if apple < p.s {
        result += p.s - apple
        p = (apple, apple+m-1)
    } else if apple > p.e {
        result += apple - p.e
        p = (apple-m+1, apple)
    }
}
print(result)


