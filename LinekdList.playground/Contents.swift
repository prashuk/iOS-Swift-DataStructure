class Node {
    var val: Int
    var next: Node?
    
    init(val: Int, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}

class LinkedList {
    var head: Node?
    var count: Int = 0
    
    func insertAtEnd(_ val: Int) -> Node? {
        let newNode = Node(val: val)
        
        if head == nil {
            count += 1
            head = newNode
            return head
        }
        
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        count += 1
        temp?.next = newNode
        
        return head
    }
    
    func insertAtStart(_ val: Int) -> Node? {
        let newNode = Node(val: val)
        if head == nil {
            count += 1
            head = newNode
            return head
        }
        
        var prev = head
        newNode.next = prev
        head = newNode
        count += 1
        
        return head
    }
    
    func insertAtPos(_ val: Int, _ pos: Int) -> Node? {
        if pos == 0 { return insertAtStart(val) }
        if pos == count { return insertAtEnd(val) }
        if pos > count { return nil }
        
        let newNode = Node(val: val)
        var temp = head
        var i = 0
        
        while i < pos-1 {
            temp = temp?.next
            i += 1
        }
        
        newNode.next = temp?.next
        temp?.next = newNode
        count += 1
        
        return head
    }
    
    func deleteFromStart() -> Node? {
        if head == nil {
            return nil
        }
        
        head = head?.next
        count -= 1
        
        return head
    }
    
    func deleteFromEnd() -> Node? {
        if head == nil { return nil }
        if head?.next == nil { return deleteFromStart() }
        
        var temp = head
        while temp?.next?.next != nil {
            temp = temp?.next
        }
        temp?.next = nil
        count -= 1
        
        return head
    }
    
    func deleteAtPos(_ pos: Int) -> Node? {
        if pos == 0 { return deleteFromStart() }
        if pos == count { return deleteFromEnd() }
        if pos > count { return nil }
        
        var temp = head
        var i = 0
        while i < pos-1 {
            temp = temp?.next
            i += 1
        }
        temp?.next = temp?.next?.next
        head = temp
        count -= 1
        
        return head
    }
    
    func traverse() {
        var temp = head
        while temp != nil {
            print(temp!.val, terminator: " -> ")
            temp = temp?.next
        }
        print("nil")
        print("Count = \(count)")
        print("\n")
    }
}

let list = LinkedList()
list.insertAtEnd(20)
list.insertAtEnd(40)
list.traverse()

list.insertAtStart(10)
list.traverse()

list.insertAtEnd(50)
list.traverse()

list.insertAtPos(30, 2)
list.traverse()

list.deleteFromStart()
list.traverse()

list.deleteFromEnd()
list.traverse()

list.deleteAtPos(1)
list.traverse()



// ---------------------Version 2----------------------------
/*

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

*/
