
final class SegmentTree {
    private var tree: [Int]
    var size: Int
    private let mod = 1000000007
    
    init(_ arr: [Int]) {
        self.size = arr.count
        self.tree = Array(repeating: 1, count: arr.count * 4)
        buildTree(arr, 0, 0, arr.count-1)
    }
    
    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = arr[start] % mod
        } else {
            let mid = (start + end) / 2
            
            buildTree(arr, node * 2 + 1, start, mid)
            buildTree(arr, node * 2 + 2, mid + 1, end)
            
            tree[node] = tree[node * 2 + 1] * tree[node * 2 + 2] % mod
        }
    }
    
    func query(_ left: Int, _ right: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) -> Int {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start { return 1 }
        if left <= start && right >= end { return tree[node] }
        
        let mid = (start + end) / 2
        let leftQuery = query(left, right, node * 2 + 1, start, mid)
        let rightQuery = query(left, right, node * 2 + 2, mid+1, end)
        
        return (leftQuery * rightQuery) % mod
    }
    
    func update(_ idx: Int, _ value: Int, _ node: Int = 0, _ start: Int = 0, _ end: Int = -1) {
        let end = end == -1 ? size - 1 : end
        
        if idx < start || idx > end { return }
        
        if start == end {
            tree[node] = value % mod
            return
        } else {
            let mid = (start + end) / 2
            
            if idx <= mid {
                update(idx, value, node * 2 + 1, start, mid)
            } else {
                update(idx, value, node * 2 + 2, mid + 1, end)
            }
            tree[node] = tree[node * 2 + 1] * tree[node * 2 + 2] % mod
        }
    }
}

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var arr = [Int](repeating: 0, count: n)
for i in 0..<n {
    arr[i] = Int(readLine()!)!
}

var sg = SegmentTree(arr)
var result = ""

for _ in 0...m+k-1 {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    
    if a == 1 {
        sg.update(b-1, c, 0)
    } else {
        result += "\(sg.query(b-1,c-1))\n"
    }
}
print(result)
