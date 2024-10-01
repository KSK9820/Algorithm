import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
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
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
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
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}



struct DisjointSet {
    private var parent: [Int]
    private var rank: [Int]
    
    init(size: Int) {
        parent = Array(0...size)
        rank = Array(repeating: 0, count: size+1)
    }
    
    mutating func union(_ a: Int, _ b: Int) {
        let ap = find(a)
        let bp = find(b)
        
        if rank[ap] < rank[bp] {
            parent[ap] = bp
        } else if rank[ap] > rank[bp] {
            parent[bp] = ap
        } else {
            parent[bp] = ap
            rank[ap] += 1
        }
    }
    
    mutating func find(_ idx: Int) -> Int {
        if parent[idx] != idx {
            parent[idx] = find(parent[idx])
        }
        return parent[idx]
    }
}

let file = FileIO()
var answer = ""
typealias Edge = (s: Int, d: Int, w: Int)
while true {
    let m = file.readInt(), n = file.readInt()
    if m == 0 && n == 0 {
        break
    }
    var edges: [Edge] = []

    for _ in 0..<n {
        let x = file.readInt(), y = file.readInt(), z = file.readInt()
        edges.append((x,y,z))
    }
    
    var ds = DisjointSet(size: m)
    var totalCost = 0
    var mstCost = 0
    
    for edge in edges.sorted(by: { $0.w < $1.w }) {
        totalCost += edge.w
        if ds.find(edge.s) != ds.find(edge.d) {
            ds.union(edge.s, edge.d)
            mstCost += edge.w
        }
    }
    answer += "\(totalCost - mstCost)\n"
}
print(answer)