
struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var ci = arr.count - 1
        var pi = (ci - 1) / 2
        
        while ci > 0 && compare(arr[pi], arr[ci]) {
            arr.swapAt(ci, pi)
            ci = pi
            pi = (ci-1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let result = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        
        while true {
            let lc = index * 2 + 1
            let rc = lc + 1
            var target = index
            
            if lc < arr.count && compare(arr[target], arr[lc]) {
                target = lc
            }
            if rc < arr.count && compare(arr[target], arr[rc]) {
                target = rc
            }
            if target == index { break }
            
            arr.swapAt(index, target)
            index = target
        }
        
        return result
    }
}


let n = Int(readLine()!)!
var h = Heap<(d: Int, w: Int)> { $0.w < $1.w }

for _ in 0..<n {
    let dw = readLine()!.split(separator: " ").map { Int($0)! }
    h.enheap((dw[0], dw[1]))
}
var result = Array(repeating: 0, count: n+1)

for _ in 1...n {
    let hw = h.deheap()!
    
    for j in (1...min(hw.d, n)).reversed() {
        if result[j] < hw.w {
            result[j] = hw.w
            break
        }
    }
}

print(result.reduce(0, +))
