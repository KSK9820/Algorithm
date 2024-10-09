let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var group = [String: [String]]()
var personal = [String: String]()

for _ in 0..<n {
    let name = readLine()!
    var names = [String]()
    for _ in 0..<Int(readLine()!)! {
        let star = readLine()!
        names.append(star)
        personal[star] = name
    }
    group[name] = names.sorted()
}
var result = ""
for _ in 0..<m {
    let name = readLine()!
    let quiz = Int(readLine()!)!
    
    if quiz == 0 {
        for i in group[name]! {
            result += "\(i)\n"
        }
    } else {
        result += "\(personal[name]!)\n"
    }
}
print(result)