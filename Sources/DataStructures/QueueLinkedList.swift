//
//  File.swift
//  
//
//  Created by Abraham Abreu on 06/01/22.
//

import Foundation

/// This is queue using a double Linked List.
public class QueueLinkedList<T>: QueueProtocol {
    
    private var list = DoublyLinkedList<T>()

    public init() { }
    
    /// Add element to the back of the queue.
    /// - Parameter element: The element to add.
    /// - Returns: True if is complete.
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    /// Remove element from the queue.
    /// - Returns: The element removed.
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
    
    /// Return the element at the front of the queue without removing it.
    public var peek: T? {
        list.first?.value
    }
    
    /// Check if the queue is empty.
    public var isEmpty: Bool {
        list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    
    public var description: String {
        String(describing: list)
    }
}
