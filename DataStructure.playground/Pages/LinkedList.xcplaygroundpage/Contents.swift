import Foundation

public class Node {
    var val: Int
    var next: Node?
    
    init(val: Int) {
        self.val = val
    }
}

public class LinkedList {
    var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var temp = head else {
            return nil
        }
        
        while let next = temp.next {
            temp = next
        }
        
        return temp
    }
    
    public var count: Int {
        guard var temp = head else {
            return 0
        }
        
        var count = 1
        while let next = temp.next {
            temp = next
            count += 1
        }
        
        return count
    }
    
    func append(val: Int) {
        let newNode = Node(val: val)
        if let lastNode = last {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
}
