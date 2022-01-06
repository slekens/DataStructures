# DataStructures

Data structure collection to have aditional structures to the Swift standar libraries. This Package contains the next data structures:

## 1. Queue

    Queues use FIFO or first-in first-out ordering, meaning the first element added will always be the first to be removed. Queuies are handy when you need to maintain the order of your elements to process later.
    
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
    - The only two essential operations for the stack are the __push__ method for adding elements and the __pop__ mehtod for removing elements.

## 3. LinkedList
    
    A linked list is a collection of values arranged in a linear, unidirectional sequence. A linked list has some theoretical advantages over contiguous options such as the Swift Array.
    
    * Constant time insertion and removal from the front of the list.
    * Reliable perfomance characteristics.
    
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
    - __Copy-on-write__ behaviour lets you achieve value semantics while maintaining good perfomance.
    
### Disclaimer

The data structures and the descriptions are stracted from the book [__Data Structures & Algorithms in Swift__](https://www.raywenderlich.com/books/data-structures-algorithms-in-swift) by Ray Wenderlich. Copyright (c) 2020 Razeware LLC.
