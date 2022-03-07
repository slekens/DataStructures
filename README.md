# DataStructures

## Objective

The objective of this repo is to have a faster way to use, learn and practice the principal data structures in real life projects or demos.

Data structure collection to have additional structures to the Swift standard libraries. This Package contains the next data structures:

## 1. Queue

Queues use FIFO or first-in first-out ordering, meaning the first element added will always be the first to be removed. Queues are handy when you need to maintain the order of your elements to process later.

There are four essential operations for a queue:

- __enqueue__: Insert an element at the back of the queue.
- __dequeue__: Remove the element at the front of the queue.
- __isEmpty__: Check if the queue is empty.
- __peek__: Return the element at the front of the queue without removing it.

Key Points

- Queue takes __FIFO__ strategy; an element added first must also be removed first.
- __Enqueue__ inserts an element to the back of the queue.
- __Dequeue__ removes the element at the front of the queue.
- Elements in an array are laid out in contiguos memory blocks, whereas elements in a linked list are more scattered with the potential for cache misses.
- Ring-buffer-queue-based implementation is suitable for queues with a fixed size.
- Compared to other data structures, leveraging two stacks improves dequeue(_:) time complexity to amortized _O(1)_ operation.
- Double-stack implementation beats out linked list in terms of storage locality.


## 2. Stack

The ___Stack___ data structure is identical, in concept, to a physical stack of objects. When you add an item to a stack, you place ir on top of the stack. When you remove an item from stack, you always remove the top-most item.

There are only two essential operations for a stack:

- __push__: Adding an element to the top of the stack.
- __pop__: Removing the top element of the stack.

Non essential operations that make a stack easier to use:
- __peek__: Look at the top of the element.
- __isEmpty__: Check if the stack is empty.

Key Points

- A stack is a __LIFO__, last-in first-out, data structure.
- Despite being so simple, the stack is a key data structure for many problems.
- The only two essential operations for the stack are the __push__ method for adding elements and the __pop__ method for removing elements.

## 3. LinkedList

A linked list is a collection of values arranged in a linear, unidirectional sequence. A linked list has some theoretical advantages over contiguous options such as the Swift Array.

* Constant time insertion and removal from the front of the list.
* Reliable performance characteristics.

There are three essential operations for add elements in a linked list:

- __push__: Adds a value at the front of the list.
- __append__: Adds a value at the end of the list.
- __insert__: Adds a value after a particular list node.

There are three essential operations for removing elements in a linked list:

- __pop__: Removes the value at the front of the list.
- __removeLast__: Removes the value at the end of the list.
- __remove(at: )__: Removes a value anywhere in the list.

Key Points

- Linked lists are linear and unidirectional. As soon as you move a reference from on node to another, you can't go back.
- Linked lists have _O(1)_ time complexity for head first insertions. Arrays have _O(n)_ time complexity for head-first insertions.
- Conforming to Swift collection protocols such as Sequence and Collection automatically gives to many helpful methods.
- __Copy-on-write__ behaviour let you achieve value semantics while maintaining good performance.

## 4. Trees

Is a  data structure of profound importance. It's used in numerous facets of software development, such as:

- Representing hierarchical relationships.
- Managing sorted data.
- Facilitating fast lookup operations.

The tree have some terms that you need to know:

- __Node__: Every section of the tree have a node. Each node can carry some data and keeps track of its children.
- __Parent and Child__: Every node connects to exactly one node above it. That node is called a parent node. The nodes directly below and connected to it are called its child nodes.
- __Leaf__: A node is a leaf if it has no children.

The are multiple strategies for different trees and different problems. But there are two main ways to iterate a tree and its nodes:

- __Depth-First Traversal__: Start at the root and visits nodes as deep as it can before backtracking.
- __Level-Order Traversal__: Visits each node of the tree based on the depth of the nodes.

KeyPoints

- Trees share similarities to linked lists, but a tree node can link to many child nodes where linked list nodes may only link to one successor node.
- Every tree node, except for the root node, has exactly one parent node.
- A root node has no parent nodes.
- Leaf nodes have no child nodes.
- Be comfortable with the tree terminology such as parent, child, leaf and root.
- Traversals, such as depth-first and level-order traversals, aren't specific to the general tree. They work on other kinds of trees, although their implementation will be slightly different based on how the tree is structured.

## 5. Binary Trees

Is a tree where each node has at most two children, often referred to as the left and right children. Binary trees serve as the basis for many tree structures and algorithms.

Previously, you looked at a level-order traversal of a tree. With a few tweaks, you can make this algorithm work for binary trees as well.

- __In-Order traversal__: Visit the nodes in the following order, starting from the root node:
    - If the current node has a left child, recursively visit this child first.
    - Then, visit the node itself.
    - If the current node has a right child, recursively visit this child. 
- __Pre-Order traversal__: Always visits the current node first, the recursively visits the left and the right child.
- __Post-Order traversal__: Only visits the current node after the left and right child have been visited recursively.

KeyPoints

- The binary tree is the foundation of some of the most important tree structures. The binary search tree and AVL trees that impose restrictions on insertion/deletion behaviours.
- In-order, pre-order and post-order traversals aren't just important only for the binary tree; if you're processing data in any tree, you'll use these traversals regularity.

## 6. Binary Search Trees

BST, is a data structure that facilitates fast lookup, insert and removal operations. BST imposes two rules on the others tree structures:

- The value of a left child must be less than the value of its parent.
- Consequently, the value of a right child must be greater than or equal to the value of its parent.

KeyPoints

- The binary search tree is a powerful data structure for holding sorted data.
- Elements of the binary search tree must be comparable. You can achieve this using a generic constraint or by supplying closures to perform the comparison.
- The time complexity for insert, remove and contains methods in a BST is O(log n).
- Performance will degrade to O(n) as the tree becomes unbalanced.

### Disclaimer

The data structures and the descriptions are extracted from the book [__Data Structures & Algorithms in Swift__](https://www.raywenderlich.com/books/data-structures-algorithms-in-swift) by Ray Wenderlich. Copyright (c) 2020 Razeware LLC.
