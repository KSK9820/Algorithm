let seq = readLine()!.split(separator: " ").map { $0.split(separator: ":").map { Int($0)! } }
let (s,e,q) = (seq[0][0] * 60 + seq[0][1], seq[1][0] * 60 + seq[1][1], seq[2][0] * 60 + seq[2][1])

var enter = Set<String>()
var finish = Set<String>()
var result = 0
while true {
    var input : String? = nil
        input = readLine()
        if input == nil || input! == "" {
            break
        }
    let a = input!.split(separator: " ").map { String($0) }
    let t = a[0].split(separator: ":").map { Int($0)! }
    let intT = t[0] * 60 + t[1]
    
    if intT <= s {
        enter.insert(a[1])
    } else if intT >= e && intT <= q {
        if enter.contains(a[1]) && !finish.contains(a[1]) {
            finish.insert(a[1])
            result += 1
        }
    }
 
}

print(result)
