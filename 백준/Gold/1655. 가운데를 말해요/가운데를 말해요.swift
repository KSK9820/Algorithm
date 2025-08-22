
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
    private var arr: [T]
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T,T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(arr[childIndex], arr[parentIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var idx = 0
        while true {
            let leftChildIndex = idx * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            var target = idx
            
            if leftChildIndex < arr.count && compare(arr[leftChildIndex], arr[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && compare(arr[rightChildIndex], arr[target]) {
                target = rightChildIndex
            }
            if target == idx { break }
            
            arr.swapAt(target, idx)
            idx = target
        }
        
        return value
    }
    
    var count: Int {
        arr.count
    }
    var root: T? {
        arr.isEmpty ? nil : arr[0]
    }
}

let fio = FileIO()
let n = fio.readInt()
var maxh = Heap<Int>(compare: >)
var minh = Heap<Int>(compare: <)

var result = ""
for _ in 0..<n {
    maxh.enheap(fio.readInt())
    
    if let left = maxh.root, let right = minh.root, left > right {
        maxh.deheap().map { minh.enheap($0) }
        minh.deheap().map { maxh.enheap($0) }
    }
    
    if maxh.count > minh.count + 1 {
        minh.enheap(maxh.deheap()!)
    } else if minh.count > maxh.count {
        maxh.enheap((minh.deheap()!))
    }
    
    result += "\(maxh.root!)\n"
}

print(result)
