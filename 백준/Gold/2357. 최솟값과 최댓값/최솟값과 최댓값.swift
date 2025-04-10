final class SegmentTree {
    private var tree: [(min: Int, max: Int)]
    var size: Int
    
    init(_ arr: [Int]) {
        self.tree = Array(repeating: (Int.max, Int.min), count: arr.count * 4)
        self.size = arr.count
        
        buildTree(arr, 0, 0, arr.count-1)
    }
    
    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = (arr[start], arr[start])
        } else {
            let mid = (start + end) / 2
            let left = node * 2 + 1
            let right = left + 1
            
            buildTree(arr, left, start, mid)
            buildTree(arr, right, mid+1, end)
            
            let leftChild = tree[left]
            let rightChild = tree[right]
            
            tree[node].min = leftChild.min < rightChild.min ? leftChild.min : rightChild.min
            tree[node].max = leftChild.max > rightChild.max ? leftChild.max : rightChild.max
        }
    }
    
    func query(_ left: Int, _ right: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) -> (min: Int, max: Int) {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start { return (Int.max, Int.min) }
        if left <= start && right >= end { return tree[node] }
        
        let mid = (start + end) / 2
        let leftquery = query(left, right, 2 * node + 1, start, mid)
        let rightquery = query(left, right, 2 * node + 2, mid + 1, end)
        
        return (min: min(leftquery.min, rightquery.min), max: max(leftquery.max, rightquery.max))
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var arr = Array(repeating: 0, count: n)
for i in 0..<n {
    arr[i] = Int(readLine()!)!
}
var sg = SegmentTree(arr)
var result = ""
for i in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b) = (ab[0], ab[1])
    
    let answer = sg.query(a-1, b-1)
    result += "\(answer.min) \(answer.max)\n"
}

print(result)
