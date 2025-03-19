import Foundation
let s = readLine()!.map { String($0) }
var result = Set<[Int]>()
var count = Array(repeating: 0, count: 26)

for i in s {
    count[Int(Character(i).asciiValue!) - 97] += 1
}
count = count.filter { $0 != 0 }
func backTracking(c: [Int], sel: [Int]) {
    if sel.count == s.count {
        result.insert(sel)
        return
    }
    
    for i in 0..<count.count {
        if c[i] > 0 {
            if sel.count > 0 {
                if sel.last! != i {
                    var newc = c
                    newc[i] -= 1
                    backTracking(c: newc, sel: sel + [i])
                }
            } else {
                var newc = c
                newc[i] -= 1
                backTracking(c: newc, sel: [i])
            }
        }
    }
}
if s.count == 0 || s.count == 1 {
    print(s.count)
} else if s.count == Set(s).count {
    var answer = 1
    for i in 2...s.count {
        answer *= i
    }
    print(answer)
} else {
    backTracking(c: count, sel: [])
    print(result.count)
}
