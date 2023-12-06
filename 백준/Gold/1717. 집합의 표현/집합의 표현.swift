
import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var array = [Int](0...n)
var result = ""

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let input = ab[0]
    let (a, b) = (ab[1], ab[2])
    
    if input == 0 {
        union(a, b)
    } else {
        let aP = find(a)
        let bP = find(b)
        
        result += aP != bP ? "NO\n" : "YES\n"
    }
}
print(result)

func find(_ index: Int) -> Int {
    if index != array[index] {
        array[index] = find(array[index])
    }
    return array[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    array[bP] = aP
}
