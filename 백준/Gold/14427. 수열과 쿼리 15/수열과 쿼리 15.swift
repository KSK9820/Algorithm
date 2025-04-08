final class SegmentTree {
    var tree: [(sum: Int, min: Int, idx: Int)]
    var size: Int
    
    init(_ arr: [Int]) {
        self.size = arr.count
        self.tree = Array(repeating: (0, Int.max, -1), count: size * 4)
        
        buildTree(arr, 0, 0, size-1)
    }

    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = (arr[start], arr[start], start)
        } else {
            let mid = (start + end) / 2
            let left = node * 2 + 1
            let right = left + 1
            
            buildTree(arr, left, start, mid)
            buildTree(arr, right, mid + 1, end)
            
            let leftChild = tree[left]
            let rightChild = tree[right]
            
            tree[node].sum = leftChild.sum + rightChild.sum
            if leftChild.min < rightChild.min || (leftChild.min == rightChild.min && leftChild.idx < rightChild.idx) {
                tree[node].min = leftChild.min
                tree[node].idx = leftChild.idx
            } else {
                tree[node].min = rightChild.min
                tree[node].idx = rightChild.idx
            }
        }
    }
    
    func query(_ left: Int, _ right: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) -> (sum: Int, min: Int, idx: Int) {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start {
            return (0, Int.max, -1)
        }
        
        if left <= start && end <= right {
            return tree[node]
        }
        
        let mid = (start + end) / 2
        let leftQuery = query(left, right, 2 * node + 1, start, mid)
        let rightQuery = query(left, right, 2 * node + 2, mid + 1, end)
        
        let sum = leftQuery.sum + rightQuery.sum
        if leftQuery.min < rightQuery.min || (leftQuery.min == rightQuery.min && leftQuery.idx < rightQuery.idx) {
            return (sum, leftQuery.min, leftQuery.idx)
        } else {
            return (sum, rightQuery.min, rightQuery.idx)
        }
    }
    
    func update(_ idx: Int, _ value: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) {
        let end = end == -1 ? size - 1 : end
        
        if start == end {
            tree[node] = (value, value, start)
        } else {
            let mid = (start + end) / 2
            let left = 2 * node + 1
            let right = left + 1
            
            if idx <= mid {
                update(idx, value, left, start, mid)
            } else {
                update(idx, value, right, mid + 1, end)
            }
            
            let leftChild = tree[left]
            let rightChild = tree[right]
            
            tree[node].sum = leftChild.sum + rightChild.sum
            if leftChild.min < rightChild.min || (leftChild.min == rightChild.min && leftChild.idx < rightChild.idx) {
                tree[node].min = leftChild.min
                tree[node].idx = leftChild.idx
            } else {
                tree[node].min = rightChild.min
                tree[node].idx = rightChild.idx
            }
        }
    }
}


let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var sg = SegmentTree(arr)

var result = ""
for _ in 0..<Int(readLine()!)! {
    let q = readLine()!.split(separator: " ").map { Int($0)! }
    
    if q[0] == 1 {
        sg.update(q[1]-1, q[2])
    } else {
        result += "\(sg.query(0, n-1).idx + 1)\n"
    }
}

print(result)
