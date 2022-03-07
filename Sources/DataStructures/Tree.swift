//
//  File.swift
//  
//
//  Created by Abraham Abreu on 04/03/22.
//

import Foundation

/// Data structure based on nodes.
public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    /// Constructing the Tree.
    /// - Parameter value: The value for the node.
    public init(_ value: T) {
        self.value = value
    }
    
    /// Adding a node to the tree.
    /// - Parameter child: The node to add.
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    
    /// Starts at the root and visit every node as deep as it can be before backtracking.
    /// - Parameter visit: The root node to start.
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    /// Visit every node of the tree based on the deep of the nodes.
    /// - Parameter visit: The root to start.
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    /// You can search a node inside the tree.
    /// - Parameter value: The value to search.
    /// - Returns: The node that contains the value.
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
