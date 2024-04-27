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

struct Heap<T> {
    private var array = [T]()
    private let compare: (T,T) -> Bool
    
    init(array: [T] = [T](), compare: @escaping (T,T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
            array.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && compare(array[target], array[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[target], array[rightChildIndex]) {
                target = rightChildIndex
            }
            if index == target { break }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let io = FileIO()
var result = ""

for i in 1...io.readInt() {
    let (n, m) = (io.readInt(), io.readInt())

    var edges = [[(d: Int, w: Int)]](repeating: [], count: m)
    var weights = [(w: Int, route: [Int])](repeating: (Int.max, []), count: m)
    var heap = Heap<(d: Int, w: Int)>{ $0.w > $1.w }
    for _ in 0..<n {
        let (x, y, z) = (io.readInt(), io.readInt(), io.readInt())
        
        edges[x].append((y, z))
        edges[y].append((x, z))
    }
    
    heap.enheap((0,0))
    weights[0].w = 0

    while true {
        guard let info = heap.deheap() else { break }
        if info.w > weights[info.d].w { continue }
        
        for edge in edges[info.d] {
            let newWeight = edge.w + info.w
            if newWeight < weights[edge.d].w {
                weights[edge.d].w = newWeight
                weights[edge.d].route = weights[info.d].route + [info.d]
                heap.enheap((edge.d, newWeight))
            }
        }
    }

    if weights[m-1].w == Int.max {
        result.append("Case #\(i): -1\n")
    } else {
        var route = weights[m-1].route.map { String($0) }.joined(separator: " ")
        route += " \(m-1)"
        result.append("Case #\(i): \(route)\n")
    }
}
result.removeLast()
print(result)