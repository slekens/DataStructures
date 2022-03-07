//
//  File.swift
//  
//
//  Created by Abraham Abreu on 06/01/22.
//

import Foundation

/// Queue data structure using a ring buffer.
public struct QueueRingBuffer<T>: QueueProtocol {
    
    private var ringBuffer: RingBuffer<T>
    
    /// Initializer
    /// - Parameter count: The size for the buffer.
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
    }
    
    /// Add an element to the queue.
    /// - Parameter element: The element to add.
    /// - Returns: True if was added successfuly or false when not.
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }
    
    /// Remove an element of the queue.
    /// - Returns: The removed element.
    public mutating func dequeue() -> T? {
        isEmpty ? nil : ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    
    public var description: String {
        String(describing: ringBuffer)
    }
}
