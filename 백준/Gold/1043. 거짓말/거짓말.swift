
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var input = readLine()!.split(separator: " ").map { Int($0)! }

var party = [[Int]]()
for _ in 0..<m {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    input.removeFirst()
    party.append(input)
}

var truth = [Int]()
if input.count == 1 {
    print(m)
} else {
    truth = Array(input[1...])
    
    var people = [Int](0...n)
    var result = m
    
    func find(_ index: Int) -> Int {
        if index != people[index] {
            people[index] = find(people[index])
        }
        return people[index]
    }
    
    func union(_ a: Int, _ b: Int) {
        let ap = find(a)
        let bp = find(b)
        
        people[max(ap, bp)] = min (ap, bp)
    }
    
    for i in truth {
        union(0, i)
    }
    
    for p in party {
        for person in 1..<p.count {
            union(p[0], p[person])
        }
    }
    
    for p in party {
        for t in truth {
            if find(p[0]) == find(t) {
                result -= 1
                break
            }
        }
    }
    print(result)
}
