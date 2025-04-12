

final class SegmentTree {
    private var tree: [Int]
    var size: Int
    
    init(_ arr: [Int]) {
        self.tree = Array(repeating: 1, count: arr.count * 4)
        self.size = arr.count
        buildTree(arr, 0, 0, arr.count-1)
    }
    
    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = arr[start]
        } else {
            let mid = (start + end) / 2
            
            buildTree(arr, node * 2 + 1, start, mid)
            buildTree(arr, node * 2 + 2, mid+1, end)
            
            tree[node] = min(tree[node * 2 + 1], tree[node * 2 + 2])
        }
    }
    
    func query(_ node: Int, _ left: Int, _ right: Int, _ start: Int = 0, _ end: Int = -1) -> Int {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start { return Int.max }
        if left <= start && right >= end { return tree[node] }
        
        let mid = (start + end) / 2
        let leftQuery = query(node * 2 + 1, left, right, start, mid)
        let rightQuery = query(node * 2 + 2, left, right, mid + 1, end)
        
        return min(leftQuery, rightQuery)
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var sg = SegmentTree(arr)
var result = ""
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(sg.query(0, ab[0] - 1, ab[1] - 1))\n"
}
print(result)
