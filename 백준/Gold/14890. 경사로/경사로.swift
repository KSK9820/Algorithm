import Foundation

let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n,l) = (nl[0], nl[1])
var arr = Array(repeating: [Int](), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}


var result = 2 * n

for y in 0..<n {
    var install = [Bool](repeating: false, count: n)
    
    inner: for x in 0..<n-1 {
        let dif = arr[y][x] - arr[y][x+1]
        if dif == 0 { continue }
        
        
        if dif == 1 {  // 내리막길
            if x+l >= n { result -= 1; break inner }
            for i in x+1...x+l {
                if arr[y][i] != arr[y][x] - 1 || install[i] { result -= 1; break inner }
            }
            for i in x+1...x+l {
                install[i] = true
            }
        } else if dif == -1 {
            if x-l+1 < 0 { result -= 1; break inner }
            for i in x-l+1...x {
                if arr[y][i] != arr[y][x]  || install[i] { result -= 1; break inner }
            }
            for i in x-l+1..<x {
                install[i] = true
            }
        } else {
            result -= 1; break inner
        }
    }
}

for x in 0..<n {
    var install = [Bool](repeating: false, count: n)
    
    inner: for y in 0..<n-1 {
        let dif = arr[y][x] - arr[y+1][x]
        if dif == 0 { continue }
        
        if dif == 1 {  // 내리막길
            if y+l >= n { result -= 1; break inner }
            for i in y+1...y+l {
                if arr[i][x] != arr[y][x] - 1 || install[i] { result -= 1; break inner }
            }
            for i in y+1...y+l {
                install[i] = true
            }
        } else if dif == -1 {
            if y-l+1 < 0 { result -= 1; break inner }
            for i in y-l+1...y {
                if arr[i][x] != arr[y][x]  || install[i] { result -= 1; break inner }
            }
            for i in y-l+1..<y {
                install[i] = true
            }
        } else {
            result -= 1; break inner
        }
    }
}

print(result)
