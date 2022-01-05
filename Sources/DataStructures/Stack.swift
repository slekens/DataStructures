//
//  File.swift
//  
//
//  Created by Abraham Abreu on 05/01/22.
//

import Foundation

/// Stack collection is a LIFO, last-in first-out, data structure.
public struct Stack<Element> {
    
    /// To store the stack element.
    private var storage: [Element] = []
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    /// Removing the top element of the stack.
    /// - Parameter element: The element to add.
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    /// Adding an alement to the top of the stack.
    /// - Returns: The added element.
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    /// Look at the top element of the stack without mutating its contents.
    /// - Returns: Return the top element.
    public func peek() -> Element? {
        storage.last
    }
    
    /// Check if the stack is empty.
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        """
        ----top----
        \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
