var answer = [Int]()
for _ in 0..<Int(readLine()!)! {
    let _ = Int(readLine()!)!
    var ss = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
    var h = Heap<Int>(compare: >)
    for s in ss {
        h.enheap(s)
    }
    var result = 1
    
    while true {
        guard let a = h.deheap() else { break }
        guard let b = h.deheap() else { break }
        
        let num = (a % 1000000007) * (b % 1000000007)
        h.enheap(num)
        result = result * (num % 1000000007) % 1000000007
    }
    answer.append(result)
}
print(answer.map { String($0) }.joined(separator: "\n"))



struct Heap<T> {
    private var arr = [T]()
    private let compare: (T,T) -> Bool
    
    init(arr: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        arr.append(newElement)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(arr[parentIndex], arr[childIndex]) {
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
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            
            if leftChildIndex < arr.count && compare(arr[target], arr[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && compare(arr[target], arr[rightChildIndex]) {
                target = rightChildIndex
            }
            if target == index { break }
            
            arr.swapAt(target, index)
            index = target
        }
        return value
    }
}
