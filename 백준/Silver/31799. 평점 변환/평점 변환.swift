let n = Int(readLine()!)!
let p = Array(readLine()!).map { String($0) }
var result = [String]()
var pp = [String]()
var i = 0
while i < p.count {

    var alphabet = ""
    if i == p.count - 1 {
        if p[i] == "+" || p[i] == "-" {
            break
        } else {
            alphabet = p[i]
            i += 1
            
        }
    } else if p[i+1] == "+" || p[i+1] == "-" || p[i+1] == "0" {
        alphabet = p[i] + p[i+1]
        i += 2
    } else {
        alphabet = p[i]
        i += 1
    }
   
    
    switch alphabet {
    case "A+":
        result.append("E")
    case "A0", "A":
        if pp.count == 0 {
            result.append("E")
        } else if ["A+", "A0", "A"].contains(pp.last!) {
            result.append("P")
        } else {
            result.append("E")
        }
    case "A-", "B+":
        if pp.count == 0 {
            result.append("P")
        } else if ["A+", "A0", "A", "A-", "B+"].contains(pp.last!) {
            result.append("D")
        } else {
            result.append("P")
        }
    case "B", "B0", "B-":
        if pp.count == 0 || ["C+", "C0", "C", "C-", "C+"].contains(pp.last!) {
            result.append("D")
        } else {
            result.append("B")
        }
    default:
        result.append("B")
    }
    pp.append(alphabet)
}
print(result.joined())
