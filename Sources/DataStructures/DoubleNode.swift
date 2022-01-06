//
//  File.swift
//  
//
//  Created by Abraham Abreu on 05/01/22.
//

import Foundation

/// Class for a Double node.
public class DoubleNode<Value> {
  
    public var value: Value
    public var next: DoubleNode<Value>?
    public var previous: DoubleNode<Value>?
  
    /// Initializer for the class.
    /// - Parameter value: The value for the node.
  public init(value: Value) {
      self.value = value
  }
}
