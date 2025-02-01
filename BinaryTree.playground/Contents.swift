class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(val: Int, left: Node? = nil, right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class BinaryTree {
    var root: Node?
    
    func inOrder(_ node: Node) {
        
    }
    
    func preOrder(_ node: Node) {
        
    }
    
    func
}

let tree = BinaryTree()
tree.root = Node(1)
tree.root?.left = Node(2)
tree.root?.right = Node(3)
tree.root?.left?.left = Node(4)
tree.root?.left?.right = Node(5)

