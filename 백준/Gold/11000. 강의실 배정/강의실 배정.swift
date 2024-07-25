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
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
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
            if leftChildIndex < array.count && compare(array[target], array[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[target], array[rightChildIndex]) {
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
    var isEmpty: Bool {
        array.isEmpty
    }
    var count: Int {
        array.count
    }
}



let n = Int(readLine()!)!
var heap = Heap<Int> (compare: >)
var lecture = [(s: Int, t: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    lecture.append((input[0], input[1]))
}
lecture = lecture.sorted(by: { $0.t < $1.t }).sorted(by: { $0.s < $1.s })
heap.enheap(lecture[0].t)
for i in 1..<n {
    guard let now = heap.deheap() else { break }
    if now <= lecture[i].s {
        heap.enheap(lecture[i].t)
    } else {
        heap.enheap(now)
        heap.enheap(lecture[i].t)
    }
}
print(heap.count)

