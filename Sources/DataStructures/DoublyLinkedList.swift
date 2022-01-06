//
//  File.swift
//  
//
//  Created by Abraham Abreu on 05/01/22.
//

import Foundation

/// This is the Double Linked list structure.
public class DoublyLinkedList<Value> {
    
    private var head: DoubleNode<Value>?
    private var tail: DoubleNode<Value>?
    
    /// Initializer
    public init() { }
    
    /// Check if the Double linked list is empty.
    public var isEmpty: Bool {
        head == nil
    }
    
    /// Get the first element of the list.
    public var first: DoubleNode<Value>? {
        head
    }
    
    /// Get the last node of the list.
    public var last: DoubleNode<Value>? {
        tail
    }
    
    /// Add a node to the front of the list.
    /// - Parameter value: The value to add.
    public func prepend(_ value: Value) {
        let newNode = DoubleNode(value: value)
        guard let headNode = head else {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = nil
        newNode.next = headNode
        headNode.previous = newNode
        
        head = newNode
    }
    
    /// Add a node to the back of the list.
    /// - Parameter value: The value to add.
    public func append(_ value: Value) {
        let newNode = DoubleNode(value: value)
        
        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    /// Removes a Node.
    /// - Parameter node: The node to remove.
    /// - Returns: The value inside the node.
    public func remove(_ node: DoubleNode<Value>) -> Value {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }
        return string + "end"
    }
}

public class LinkedListIterator<Value>: IteratorProtocol {
    
    private var current: DoubleNode<Value>?
    
    init(node: DoubleNode<Value>?) {
        current = node
    }
    
    public func next() -> DoubleNode<Value>? {
        defer { current = current?.next }
        return current
    }
}

extension DoublyLinkedList: Sequence {
    
    public func makeIterator() -> LinkedListIterator<Value> {
        LinkedListIterator(node: head)
    }
}
