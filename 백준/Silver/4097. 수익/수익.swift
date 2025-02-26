import Foundation

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    var array = [Int](repeating: 0, count: n+1)
    array[0] = -Int.max
    for i in 1...n {
        array[i] = Int(readLine()!)!
    }
    
    var result = array
    for i in 2...n {
        result[i] = max(result[i-1] + array[i], result[i])
    }
    print(result.max()!)
}
