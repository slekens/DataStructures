//
//  File.swift
//  
//
//  Created by Abraham Abreu on 06/01/22.
//

import Foundation

/// Data structure to implement a data stream.
public struct RingBuffer<T> {
    
    private var array: [T?]
    private var readIndex = 0
    private var writeIndex = 0
    
    /// Initializer for the buffer.
    /// - Parameter count: The size of the buffer.
    public init(count: Int) {
        array = Array<T?>(repeating: nil, count: count)
    }
    
    /// The first element of the buffer.
    public var first: T? {
        array[readIndex]
    }
    
    /// Add element to the buffer.
    /// - Parameter element: The element to add.
    /// - Returns: If the operation was a success.
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    /// Return the back element in the buffer.
    /// - Returns: The element read.
    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    public var availableSpaceForReading: Int {
        writeIndex - readIndex
    }
    
    public var isEmpty: Bool {
        availableSpaceForReading == 0
    }
    
    public var availableSpaceForWriting: Int {
        array.count - availableSpaceForReading
    }
    
    /// Check if the buffer is full.
    public var isFull: Bool {
        availableSpaceForWriting == 0
    }
}

extension RingBuffer: CustomStringConvertible {
    
    public var description: String {
        let values = (0..<availableSpaceForReading).map {
            String(describing: array[($0 + readIndex) % array.count]!)
        }
        return "[" + values.joined(separator: ", ") + "]"
    }
}
