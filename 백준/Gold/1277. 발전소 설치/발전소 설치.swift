import Foundation

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
}


let nw = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w) = (nw[0], nw[1])
let m = Double(readLine()!)!

var edge = [[(d: Int, w: Double)]](repeating: [], count: n+1)
var weights = [Double](repeating: Double.greatestFiniteMagnitude, count: n+1)
var heap = Heap<(d: Int, w: Double)> (compare: >)
var location = [(y: Int, x: Int)](repeating: (0,0), count: n+1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    location[i] = (input[0], input[1])
}
var connected = [Int](repeating: 0, count: n+1)

for _ in 0..<w {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let distance = getDistance(location[input[0]], location[input[1]])
    connected[input[0]] = input[1]
    connected[input[1]] = input[0]
    
    edge[input[0]].append((input[1], 0))
    edge[input[1]].append((input[0], 0))
}

for i in 1..<n {
    for j in (i+1)...n {
        if connected[i] == j { continue }
        let distance = getDistance(location[i], location[j])
        if distance < m && i != j {
            edge[i].append((j, distance))
            edge[j].append((i, distance))
        }
    }
}

func getDistance(_ a: (y: Int, x: Int), _ b: (y: Int, x: Int)) -> Double {
    return sqrt(pow(Double(abs(a.x - b.x)), 2) + pow(Double(abs(a.y - b.y)), 2))
}

heap.enheap((1,0))
weights[1] = 0

var before = [Int](repeating: 0, count: n+1)
while true {
    guard let info = heap.deheap() else { break }
    
    if info.w > weights[info.d] { continue }
    if info.d == n { break }

    for e in edge[info.d] {
        let newWeight = info.w + e.w
        if newWeight < weights[e.d] {
            weights[e.d] = newWeight
            heap.enheap((e.d, newWeight))
            before[e.d] = info.d
        }
    }
}


print(Int(floor(weights[n]*1000)))
