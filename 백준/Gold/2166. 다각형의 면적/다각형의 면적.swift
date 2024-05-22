import Foundation

let n = Int(readLine()!)!
var dohyeong = [(Int, Int)]()
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    dohyeong.append((input[0], input[1]))
}

var x1y1 = 0
var x2y2 = 0
for i in 0..<n-1 {
    x1y1 += dohyeong[i].0 * dohyeong[i+1].1
    x2y2 += dohyeong[i].1 * dohyeong[i+1].0
}
x1y1 += dohyeong.last!.0 * dohyeong[0].1
x2y2 += dohyeong[0].0 * dohyeong.last!.1

let result = Double(abs(x1y1 - x2y2)) * 0.5
print(String(format: "%.1f", result))