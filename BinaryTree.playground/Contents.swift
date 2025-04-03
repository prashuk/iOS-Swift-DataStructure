class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(_ val: Int, _ left: Node? = nil, _ right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class BinaryTree {
    var root: Node?
    
    func inOrder(_ node: Node?) {
        guard let node else { return }
        inOrder(node.left)
        print(node.val, terminator: " ")
        inOrder(node.right)
    }
    
    func preOrder(_ node: Node?) {
        guard let node else { return }
        print(node.val, terminator: " ")
        preOrder(node.left)
        preOrder(node.right)
    }
    
    func postOrder(_ node: Node?) {
        guard let node else { return }
        postOrder(node.left)
        postOrder(node.right)
        print(node.val, terminator: " ")
    }
    
    func levelOrder(_ node: Node?) -> [[Int]] { // BFS
        guard let node else { return [] }
        
        var queue: [Node] = [node]
        var order: [[Int]] = []
        
        while !queue.isEmpty {
            var levelValues = [Int]()
            let temp = queue
            queue.removeAll()
            
            for node in temp {
                levelValues.append(node.val)
                
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            order.append(levelValues)
        }
        
        return order
    }
    
    func zigZagOrder(_ node: Node?) -> [[Int]] { // BFS
        guard let node else { return [] }
        
        var queue: [Node] = [node]
        var order: [[Int]] = []
        var leftToRight = false
        
        while !queue.isEmpty {
            var levelValues = [Int]()
            let temp = queue
            queue.removeAll()
            
            for node in temp {
                if leftToRight {
                    levelValues.append(node.val)
                } else {
                    levelValues.insert(node.val, at: 0)
                }
                
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            order.append(levelValues)
            
            leftToRight.toggle()
        }
        
        return order
    }
}

let tree = BinaryTree()
tree.root = Node(1)

tree.root?.left = Node(2)
tree.root?.right = Node(3)

tree.root?.left?.left = Node(4)
tree.root?.left?.right = Node(5)
tree.root?.right?.left = Node(6)
tree.root?.right?.right = Node(7)

tree.root?.left?.left?.left = Node(8)
tree.root?.left?.left?.right = Node(9)
tree.root?.left?.right?.left = Node(10)
tree.root?.left?.right?.right = Node(11)
tree.root?.right?.left?.left = Node(12)
tree.root?.right?.left?.right = Node(13)
tree.root?.right?.right?.left = Node(14)
tree.root?.right?.right?.right = Node(15)

tree.inOrder(tree.root)
print()

tree.preOrder(tree.root)
print()

tree.postOrder(tree.root)
print()

print(tree.levelOrder(tree.root))
print(tree.zigZagOrder(tree.root))
