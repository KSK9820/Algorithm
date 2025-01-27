struct Node<T> {
    let data: T
    let left: T
    let right: T
}

let n = Int(readLine()!)!
var tree = [String: Node<String>]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    tree[input[0]] = Node(data: input[0], left: input[1], right: input[2])
}


var result = ""
func preOrder(node: Node<String>) {
    result += "\(node.data)"
    if node.left != "." {
        preOrder(node: tree[node.left]!)
    }
    if node.right != "." {
        preOrder(node: tree[node.right]!)
    }
}
func inOrder(node: Node<String>) {
    if node.left != "." {
        inOrder(node: tree[node.left]!)
    }
    result += "\(node.data)"
    if node.right != "." {
        inOrder(node: tree[node.right]!)
    }
}
func postOrder(node: Node<String>) {
    if node.left != "." {
        postOrder(node: tree[node.left]!)
    }
    if node.right != "." {
        postOrder(node: tree[node.right]!)
    }
    result += "\(node.data)"
}


let startNode = Node(data: "A", left: tree["A"]!.left   , right: tree["A"]!.right)
preOrder(node: startNode)
result += "\n"
inOrder(node: startNode)
result += "\n"
postOrder(node: startNode)
print(result)
