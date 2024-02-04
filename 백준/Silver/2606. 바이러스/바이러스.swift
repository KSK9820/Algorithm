import Foundation

let c = Int(readLine()!)!
let r = Int(readLine()!)!
var network = Array(repeating: Array(repeating: 0, count: 0), count: c)
var visited = [Bool](repeating: false, count: c)
for _ in 0..<r {
    let input = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    network[input[0]].append(input[1])
    network[input[1]].append(input[0])
}

var stack = network[0]
while true {
    guard let a = stack.popLast() else { break }
    if visited[a] == true { continue }
    visited[a] = true
    
    for n in network[a] {
        if visited[n] == false {
            stack.append(n)
        }
    }
}
let result = visited.filter { $0 == true }.count
print(result == 0 ? 0 : result - 1)
