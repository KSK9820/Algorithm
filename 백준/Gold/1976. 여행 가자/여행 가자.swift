
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var cities = [Int](0..<n)
var result = "YES"

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for j in i..<input.count {
        if input[j] == 1 {
            union(i, j)
        }
    }
}
var plans = readLine()!.split(separator: " ").map { Int($0)! - 1 }

for city in plans {
    let cP = find(city)
    
    if cP != cities[plans[0]] {
        result = "NO"
    }
}

print(result)

func find(_ index: Int) -> Int {
    if cities[index] != index {
        cities[index] = find(cities[index])
    }
    return cities[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    cities[bP] = aP
}
