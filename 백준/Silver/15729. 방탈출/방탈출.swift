import Foundation

let n = Int(readLine()!)!
var status = readLine()!.split(separator: " ").map { Int($0)! == 1 ? true : false }
let button = [Bool](repeating: false, count: n)
var result = 0
while true {
    for i in 0..<n {
        if status[i] == true {
            for j in 0...2 where i + j < n {
                status[j+i].toggle()
            }
            result += 1
        }
    }
    if status == button { break }
}
print(result)