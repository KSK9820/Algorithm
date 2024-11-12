import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()
var result = ""
for _ in 0..<file.readInt() {
    let n = file.readInt()
    var sinib = [(s: Int, m: Int)]()
    for _ in 0..<n {
        sinib.append((file.readInt(), file.readInt()))
    }
    sinib = sinib.sorted { $0.s < $1.s }
    
    var hireRank = sinib[0].m
    var hire = 1
    for i in 1..<n {
        if sinib[i].m < hireRank {
            hire += 1
            hireRank = sinib[i].m
        }
    }
    
    result += "\(hire)\n"
}
result.popLast()
print(result)