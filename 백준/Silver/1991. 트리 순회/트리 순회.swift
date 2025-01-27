let n = Int(readLine()!)!
var tree = [String: [String]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    tree[input[0]] = [input[1], input[2]]
}


var result = ""
func preOrder(node: String) {
    result += "\(node)"
    if tree[node]![0] != "." {
        preOrder(node: tree[node]![0])
    }
    if tree[node]![1] != "." {
        preOrder(node: tree[node]![1])
    }
}
func inOrder(node: String) {
    if tree[node]![0] != "." {
        inOrder(node: tree[node]![0])
    }
    result += "\(node)"
    if tree[node]![1] != "." {
        inOrder(node: tree[node]![1])
    }
}
func postOrder(node: String) {
    if tree[node]![0] != "." {
        postOrder(node: tree[node]![0])
    }
    if tree[node]![1] != "." {
        postOrder(node: tree[node]![1])
    }
    result += "\(node)"
}

preOrder(node: "A")
result += "\n"
inOrder(node: "A")
result += "\n"
postOrder(node: "A")
print(result)
