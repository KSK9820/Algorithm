
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var classRoom = [Int](0..<n)

var count = 0
for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (i, j) = (ij[0], ij[1])
    
    union(i, j)
}

let lectures = readLine()!.split(separator: " ").map { Int($0)! - 1 }
for i in 0..<lectures.count - 1 {
    let start = find(lectures[i])
    let end = find(lectures[i+1])
    
    if start != end {
        count += 1
    }
}

print(count)

func find(_ index: Int) -> Int {
    if classRoom[index] != index {
        classRoom[index] = find(classRoom[index])
    }
    return classRoom[index]
}


func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    classRoom[bP] = aP
}


