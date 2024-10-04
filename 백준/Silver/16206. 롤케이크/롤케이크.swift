let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
let r = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0
var roll = [Int]()
var roll20 = 0
var roll0 = [Int]()
for i in r {
    if i == 10 { result += 1 }
    else if i == 20 { roll20 += 1 }
    else if i % 10 == 0 { roll0.append(i) }
    else if i > 10 { roll.append(i) }
}

if roll20 >= m {
    print(result + m * 2)
} else {
    roll0 = roll0.sorted(by: >)
    for i in 0..<(m) {
        if roll20 != 0 {
            result += 2
            roll20 -= 1
            continue
        }
        if let now = roll0.popLast() {
            if now - 10 == 20 {
                roll20 += 1
            } else if now - 10 > 10 {
                roll0.append(now-10)
            } 
            result += 1
            continue
        }
        if let now = roll.popLast() {
            if now - 10 >= 10 {
                roll.append(now-10)
            }
            result += 1
            continue
        }
        
    }
    print(result)
}