final class SegmentTree {
    private var tree: [(min: Int, idx: Int)]
    var size: Int
    
    init(_ arr: [Int]) {
        self.tree = Array(repeating: (1,-1), count: arr.count * 4)
        self.size = arr.count
        buildTree(arr, 0, 0, arr.count-1)
    }
    
    private func buildTree(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = (arr[start], start)
        } else {
            let mid = (start + end) / 2
            
            buildTree(arr, node * 2 + 1, start, mid)
            buildTree(arr, node * 2 + 2, mid+1, end)
            
            tree[node] = tree[node * 2 + 1].min < tree[node * 2 + 2].min ? tree[node * 2 + 1] : tree[node * 2 + 2]
        }
    }
    
    func query(_ node: Int, _ left: Int, _ right: Int, _ start: Int = 0, _ end: Int = -1) -> (min: Int, idx: Int) {
        let end = end == -1 ? size - 1 : end
        
        if left > end || right < start { return (Int.max, -1) }
        if left <= start && right >= end { return tree[node] }
        
        let mid = (start + end) / 2
        let leftQuery = query(node * 2 + 1, left, right, start, mid)
        let rightQuery = query(node * 2 + 2, left, right, mid + 1, end)
        
        return leftQuery.min < rightQuery.min ? leftQuery : rightQuery
    }
}

var result = ""
while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    if n == 0 { break }
    let arr = Array(input[1...n])
    
    let sg = SegmentTree(arr)
    result += "\(getRectSize(l: 0, r: n-1))\n"
    
    
    func getRectSize(l: Int, r: Int) -> Int {
        if l > r { return 0 }
        
        let height = sg.query(0, l, r)
        
        let wholeWidth = (r-l+1) * height.min
        let leftwidth = getRectSize(l: l, r: height.idx-1)
        let rightwidth = getRectSize(l: height.idx+1, r: r)

        return max(wholeWidth, leftwidth, rightwidth)
    }
}

print(result)
