//
//  File.swift
//  
//
//  Created by Abraham Abreu on 05/01/22.
//

import Foundation

/// LinkedList struct.
public struct LinkedList<Value> {
    
    /// Head node.
    public var head: Node<Value>?
    
    /// Tail node.
    public var tail: Node<Value>?
    
    /// Initializer.
    public init() {}
    
    /// Property to check if the list is empty.
    public var isEmpty: Bool {
        head == nil
    }
    
    /// Add a value at the front of the list.
    /// - Parameter value: The value to insert.
    public mutating func push(_ value: Value) {
        
        copyNodes()
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    /// Adds a value at the end of the list.
    /// - Parameter value: The value to insert.
    public mutating func append(_ value: Value) {
        
        copyNodes()
        
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    /// Find a node at a particular place.
    /// - Parameter index: The index position.
    /// - Returns: The new value inserted.
    public func node(at index: Int) -> Node<Value>? {
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    /// Insert a new node in a specific place.
    /// - Parameters:
    ///   - value: The new value to add.
    ///   - node: The place for insert the new node.
    /// - Returns: The new node inserted.
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        
        copyNodes()
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    /// Removes the value at the  front  of the list.
    /// - Returns: The value removed.
    public mutating func pop() -> Value? {
        
        copyNodes()
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    /// Removes the value at the end of the list.
    /// - Returns: The value removed.
    public mutating func removeLast() -> Value? {
        
        copyNodes()
        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    /// Remove a value anywhere in the list.
    /// - Parameter node: The node place.
    /// - Returns: The value removed.
    public mutating func remove(after node: Node<Value>) -> Value? {
        
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    /// Creates a copy for every node to support value semantics.
    private mutating func copyNodes()  {
        
        guard !isKnownUniquelyReferenced(&head) else  {
            return
        }
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        return nodeCopy
    }
}

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func ==(lhs: Index,  rhs: Index) -> Bool {
            switch(lhs.node, rhs.node)  {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
