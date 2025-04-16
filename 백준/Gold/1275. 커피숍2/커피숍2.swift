
final class SegmentTree {
    private var tree: [Int]
    var size: Int
    
    init(_ arr: [Int]) {
        self.size = arr.count
        self.tree = Array(repeating: 1, count: arr.count * 4)
        buildTree(arr, 0, 0, arr.count-1)
    }
    
    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = arr[start]
        } else {
            let mid = (start + end) / 2
            
            buildTree(arr, node * 2 + 1, start, mid)
            buildTree(arr, node * 2 + 2, mid + 1, end)
            
            tree[node] = tree[node * 2 + 1] + tree[node * 2 + 2]
        }
    }
    
    func query(_ left: Int, _ right: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) -> Int {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start { return 0 }
        if left <= start && right >= end { return tree[node] }
        
        let mid = (start + end) / 2
        let leftQuery = query(left, right, node * 2 + 1, start, mid)
        let rightQuery = query(left, right, node * 2 + 2, mid+1, end)
        
        return leftQuery + rightQuery
    }
    
    func update(_ idx: Int, _ value: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) {
        let end = end == -1 ? size - 1 : end
        
        if idx < start || idx > end { return }
        
        if start == end {
            tree[node] = value
            return
        } else {
            let mid = (start + end) / 2
            
            if idx <= mid {
                update(idx, value, node * 2 + 1, start, mid)
            } else {
                update(idx, value, node * 2 + 2, mid + 1, end)
            }
            tree[node] = tree[node * 2 + 1] + tree[node * 2 + 2]
        }
    }
}



let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n,q) = (nq[0], nq[1])

var arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""
var sg = SegmentTree(arr)
for _ in 0..<q {
    let xyab = readLine()!.split(separator: " ").map { Int($0)! }
    let (x,y) = (min(xyab[0], xyab[1]), max(xyab[0], xyab[1]))
    let (a,b) = (xyab[2], xyab[3])
    
    result += "\(sg.query(x-1, y-1))\n"
    sg.update(a-1, b)
}

print(result)
