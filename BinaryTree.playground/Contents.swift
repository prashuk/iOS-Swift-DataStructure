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
    
    func levelOrder(_ node: Node?) { // BFS
        guard let node else { return }
        var queue: [Node] = [node]
        
        while !queue.isEmpty {
            let newNode = queue.removeFirst()
            print(newNode.val, terminator: " ")
            
            if let node = newNode.left { queue.append(node) }
            if let node = newNode.right { queue.append(node) }
        }
    }
    
    func zigZagOrder(_ node: Node?) {
        guard let node else { return }
        var queue: [Node] = [node]
        var leftToRigh = false
        
        while !queue.isEmpty {
            var levelValues = [Int]()
            
            for i in 0..<queue.count {
                let newNode = queue.removeFirst()
                
                if leftToRigh {
                    levelValues.append(newNode.val)
                } else {
                    levelValues.insert(newNode.val, at: 0)
                }
                
                if let node = newNode.left { queue.append(node) }
                if let node = newNode.right { queue.append(node) }
            }
            print(levelValues.map { String($0) }.joined(separator: " "), terminator: " ")
            leftToRigh.toggle()
        }
    }
}

let tree = BinaryTree()
tree.root = Node(1)
tree.root?.left = Node(2)
tree.root?.right = Node(3)
tree.root?.left?.left = Node(4)
tree.root?.left?.right = Node(5)

tree.inOrder(tree.root)
print()
tree.preOrder(tree.root)
print()
tree.postOrder(tree.root)
print()
tree.levelOrder(tree.root)
print()
tree.zigZagOrder(tree.root)
