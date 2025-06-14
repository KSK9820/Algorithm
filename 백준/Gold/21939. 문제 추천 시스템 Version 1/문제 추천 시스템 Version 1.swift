
struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty {
            return nil
        }
        if array.count == 1 {
            return array.removeLast()
        }
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if target == index {
                break
            }
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}



var h1 = Heap<(p: Int, l: Int)> {
    if $0.l == $1.l { return $0.p > $1.p }
    return $0.l > $1.l
}
var h2 = Heap<(p: Int, l: Int)> {
    if $0.l == $1.l { return $0.p < $1.p }
    return $0.l < $1.l
}
var pset = [Int:Int]()

for _ in 0..<Int(readLine()!)! {
    let pl = readLine()!.split(separator: " ").map { Int($0)! }
    let (p, l) = (pl[0], pl[1])
    
    pset[p] = l
    h1.enheap((p,l))
    h2.enheap((p,l))
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    
    switch input[0] {
    case "solved":
        pset[Int(input[1])!] = nil
    case "add":
        let (p,l) = (Int(input[1])!, Int(input[2])!)
        pset[p] = l
        h1.enheap((p,l))
        h2.enheap((p,l))
    case "recommend":
        if input[1] == "1" {
            while true {
                let now = h1.deheap()!
                if pset[now.p] == nil || pset[now.p] != now.l { continue }
                h1.enheap(now)
                result += "\(now.p)\n"
                break
            }
        } else {
            while true {
                let now = h2.deheap()!
                if pset[now.p] == nil || pset[now.p] != now.l  { continue }
                h2.enheap(now)
                result += "\(now.p)\n"
                break
            }
        }
    default:
        break
    }
}

print(result)

