
final class SegmentTree {
    private var tree: [Int]
    var size: Int
    
    init(_ arr: [Int]) {
        self.tree = Array(repeating: Int.max, count: arr.count * 4)
        self.size = arr.count
        
        buildTree(arr, 0, 0, arr.count - 1)
    }
    
    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = arr[start]
        } else {
            let mid = (start + end) / 2
            let left = node * 2 + 1
            let right = left + 1
            
            buildTree(arr, left, start, mid)
            buildTree(arr, right, mid+1, end)
            
            let leftChild = tree[left]
            let rightChild = tree[right]
            
            tree[node] = leftChild + rightChild
        }
    }
    
    func query(_ left: Int, _ right: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) -> Int {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start {
            return 0
        }
        
        if left <= start && right >= end {
            return tree[node]
        }
        
        let mid = (start + end) / 2
        let leftIndex = 2 * node + 1
        let rightIndex = leftIndex + 1
        let leftQuery = query(left, right, leftIndex, start, mid)
        let rightQuery = query(left, right, rightIndex, mid + 1, end)
        
        return leftQuery + rightQuery
    }
    
    func update(_ idx: Int, _ value: Int, _ node: Int, _ start: Int = 0, _ end: Int = -1) {
        let end = end == -1 ? size - 1 : end
        
        if start == end {
            tree[node] = value
        } else {
            let mid = (start + end) / 2
            let leftIndex = 2 * node + 1
            let rightIndex = leftIndex + 1
            
            if idx <= mid {
                update(idx, value, leftIndex, start, mid)
            } else {
                update(idx, value, rightIndex, mid + 1, end)
            }
            
            let leftChild = tree[leftIndex]
            let rightChild = tree[rightIndex]
            
            tree[node] = leftChild + rightChild
        }
    }
    
}

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var arr = Array(repeating: 0, count: n)
for i in 0..<n {
    arr[i] = Int(readLine()!)!
}

var sg = SegmentTree(arr)
var result = ""
for _ in 0..<m + k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    if input[0] == 1 {
        sg.update(input[1]-1, input[2], 0)
    } else {
        result += "\(sg.query(input[1]-1, input[2]-1))\n"
    }
}

print(result)
 
 
