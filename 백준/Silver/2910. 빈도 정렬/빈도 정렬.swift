let nc = readLine()!.split(separator: " ").map { Int($0)! }
let (n,c) = (nc[0], nc[1])
var m = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int: (c: Int, i: Int)]()
for i in 0..<n {
    result[m[i], default: (0, i)].c += 1
}

var answer = ""
for i in result.sorted(by: {
    
    if $0.value.c == $1.value.c {
        return $0.value.i < $1.value.i
    }
    return $0.value.c > $1.value.c
}) {
    for j in 0..<i.value.c {
        answer += "\(i.key) "
    }
}
print(answer)
