//
//  File.swift
//  
//
//  Created by Abraham Abreu on 06/01/22.
//

import Foundation

/// Protocol to give the basic elements to build a Queue.
public protocol QueueProtocol {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
