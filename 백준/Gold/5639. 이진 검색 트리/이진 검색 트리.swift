
var tree = [Int]()
while let input = readLine(), let n = Int(input) {
    tree.append(n)
}

var result = [Int]()

func bst(_ arr: [Int]) -> [Int] {
    if arr.isEmpty { return [] }
    if arr.count == 1 { return arr }
    
    let root = arr[0]
    let idx = arr.firstIndex { $0 > root } ?? arr.count
    
    let leftSubtree = Array(arr[1..<idx])
    let rightSubtree = idx <= arr.count ? Array(arr[idx..<arr.count]) : []

    var result = bst(leftSubtree)
    result.append(contentsOf: bst(rightSubtree))
    result.append(root)
    
    return result
}

print(bst(tree).map { String($0) }.joined(separator: "\n"))
