struct Heap<T> {
    var arr = [T]()
    let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ new: T) {
        arr.append(new)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex-1)/2
        
        while childIndex > 0 && compare(arr[parentIndex], arr[childIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex-1)/2
        }
    }
    
    mutating func deheap() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            
            while leftChildIndex < arr.count && compare(arr[target], arr[leftChildIndex]) {
                target = leftChildIndex
            }
            
            while rightChildIndex < arr.count && compare(arr[target], arr[rightChildIndex]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
    
    var root: T? {
        arr.first
    }
    
    var isEmpty: Bool {
        arr.isEmpty
    }
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    var maxh = Heap<(Int, Int)> { $0.0 < $1.0 }
    var minh = Heap<(Int, Int)> { $0.0 > $1.0 }
    var del = Set<Int>()
    
    for i in 0..<Int(readLine()!)! {
        let input = readLine()!.split(separator: " ").map { String($0) }
        
        if input[0] == "I" {
            maxh.enheap((Int(input[1])!, i))
            minh.enheap((Int(input[1])!, i))
            continue
        }
        
        if input[1] == "-1" {
            guard let root = minh.root else { continue }
            if del.contains(root.1) {
                while true {
                    guard let a = minh.deheap() else { break }
                    if !del.contains(a.1) {
                        del.insert(a.1)
                        break
                    }
                }
            } else {
                del.insert(minh.deheap()!.1)
            }
        } else if input[1] == "1" {
            guard let root = maxh.root else { continue }
            if del.contains(root.1) {
                while !maxh.isEmpty {
                    if let a = maxh.deheap() {
                        if !del.contains(a.1) {
                            del.insert(a.1)
                            break
                        }
                    }
                }
            } else {
                del.insert(maxh.deheap()!.1)
            }
        }
    }
    
    var minv: Int? = nil
    var maxv: Int? = nil
    
    while true {
        guard let a = minh.deheap() else { break }
        if !del.contains(a.1) {
            minv = a.0
            break
        }
    }
    while true {
        guard let a = maxh.deheap() else { break }
        if !del.contains(a.1) {
            maxv = a.0
            break
        }
    }
    
    if minv == nil && maxv == nil {
        result += "EMPTY\n"
    } else if minv == nil {
        result += "\(maxv!) \(maxv!)\n"
    } else if maxv == nil {
        result += "\(minv!) \(minv!)\n"
    } else {
        result += "\(maxv!) \(minv!)\n"
    }
}
print(result)
