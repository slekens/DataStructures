//
//  File.swift
//  
//
//  Created by Abraham Abreu on 05/01/22.
//

import Foundation

/// Class for a simple node.
public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    /// Initializer for the Node.
    /// - Parameters:
    ///   - value: The value for the node.
    ///   - next: The next node.
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return  "\(value) -> " + String(describing: next) + " "
    }
}
