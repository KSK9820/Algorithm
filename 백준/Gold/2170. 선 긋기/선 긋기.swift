import Foundation


final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
let fileio = FileIO()
let n = fileio.readInt()
var arr = [(x: Int, y: Int)]()

for _ in 0..<n {
    var x = fileio.readInt()
    var y = fileio.readInt()
    x = min(x,y)
    y = max(x,y)
    arr.append((x, y))
}
arr = arr.sorted { $0.y < $1.y }.sorted { $0.x < $1.x}

var result = 0
var last = arr[0]
if n == 1 {
    result = arr[0].y - arr[0].x
} else {
    for i in 1..<n {
        if last.y < arr[i].x {
            result += last.y - last.x
            last = arr[i]
        } else {
            if last.y < arr[i].y {
                last.y = arr[i].y
            }
        }
        
        if i == n-1 {
            result += last.y - last.x
        }
    }
}
print(result)