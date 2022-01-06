//
//  File.swift
//  
//
//  Created by Abraham Abreu on 06/01/22.
//

import Foundation

///  Use FIFO First-In First-Out ordering.
public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    
    public init() { }
    
    /// Check if the queue is empty.
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    /// Return the first element in the queue without removing it.
    public var peek: T? {
        array.first
    }
    
    /// Insert an element at the back of the queue.
    /// - Parameter element: The element to add.
    /// - Returns: True if the operation was successful.
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    /// Remove the element at the front of the queue.
    /// - Returns: Return the element added.
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        String(describing: array)
    }
}
