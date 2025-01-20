let sp = readLine()!.split(separator: " ").map { Int($0)! }
let (s,p) = (sp[0], sp[1])

var dna = readLine()!.map { String($0) }
var acgt = readLine()!.split(separator: " ").map { Int($0)! }

var pw = ["A": 0, "C": 0, "G": 0, "T": 0]
var result = 0
for i in 0..<p {
    pw[dna[i]]! += 1
}

if pw["A"]! >= acgt[0] && pw["C"]! >= acgt[1] && pw["G"]! >= acgt[2] && pw["T"]! >= acgt[3] {
    result += 1
}
    
for i in p..<s {
    pw[dna[i-p]]! -= 1
    pw[dna[i]]! += 1
    
    if pw["A"]! >= acgt[0] && pw["C"]! >= acgt[1] && pw["G"]! >= acgt[2] && pw["T"]! >= acgt[3] {
        result += 1
    }
}
print(result)
