let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var chess = [[String]]()
var black = Array(repeating: Array(repeating: 0, count: m), count: n)
var white = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0..<n {
    chess.append(Array(readLine()!).map { String($0) })
}


chess.enumerated().forEach {
    let value = $0.element
    let index = $0.offset

    value.enumerated().forEach { inner in
        if index % 2 == 0 {
            if inner.offset % 2 == 1 && chess[index][inner.offset] != "B" {
                white[index][inner.offset] = 1
            }
            if inner.offset % 2 == 0 && chess[index][inner.offset] != "W" {
                white[index][inner.offset] = 1
            }
        }
        if index % 2 == 1 {
            if inner.offset % 2 == 1 && chess[index][inner.offset] != "W" {
                white[index][inner.offset] = 1
            }
            if inner.offset % 2 == 0 && chess[index][inner.offset] != "B" {
                white[index][inner.offset] = 1
            }
        }
    }
    
    value.enumerated().forEach { inner in
        if index % 2 == 0 {
            if inner.offset % 2 == 1 && chess[index][inner.offset] != "W" {
                black[index][inner.offset] = 1
            }
            if inner.offset % 2 == 0 && chess[index][inner.offset] != "B" {
                black[index][inner.offset] = 1
            }
        }
        if index % 2 == 1 {
            if inner.offset % 2 == 1 && chess[index][inner.offset] != "B" {
                black[index][inner.offset] = 1
            }
            if inner.offset % 2 == 0 && chess[index][inner.offset] != "W" {
                black[index][inner.offset] = 1
            }
        }
    }
}


var blackCount = n * m
var whiteCount = n * m


for j in 0..<(m - 7) {
    for i in 0..<(n - 7) {
        var compareBlack = 0
        var compareWhite = 0
        for k in j..<j+8 {
            for m in i..<i+8 {
                compareBlack += black[m][k]
                compareWhite += white[m][k]
            }
        }
        blackCount = min(blackCount, compareBlack)
        whiteCount = min(whiteCount, compareWhite)
    }
   
}
print(min(blackCount, whiteCount))


