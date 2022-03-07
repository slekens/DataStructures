import XCTest
@testable import DataStructures

final class DataStructuresTests: XCTestCase {
    
    func testNode() throws {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        
        XCTAssertNotNil(node1)
    }
    
    // MARK: - Stack Tests
    func testStack() throws {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        
        if let poppedElement = stack.pop() {
            assert(4 == poppedElement)
        }
    }
    
    // MARK: - LinkedList Tests for pushing.
    func testLinkedList() throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        if let lastElement = linkedList.removeLast() {
            assert(3 == lastElement)
        }
    }
    
    // MARK: - LinkedList Test for appending.
    func testLinkedListAppend() throws {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        XCTAssertNotNil(linkedList)
    }
    
    // MARK: - LinkedList Test inserting after.
    func testLinkedListInsert() throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        let middleNode = linkedList.node(at: 1)!
        let result = linkedList.insert(-1, after: middleNode)
        
        XCTAssertTrue(result.value == -1)
    }
    
    // MARK: - LinkedList Test popping value.
    func testLinkedListPop() throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        let poppedValue = linkedList.pop()
        XCTAssertTrue(poppedValue == 1)
    }
    
    // MARK: - LinkedList Test removeLast.
    func testLinkedListRemoveLast() throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        let removedValue = linkedList.removeLast()
        
        XCTAssertTrue(removedValue == 3)
    }
    
    // MARK: - Linked List removeAfter
    func testLinkedListRemoveAfter() {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        let index = 1
        let node = linkedList.node(at: index - 1)!
        let removed = linkedList.remove(after: node)!
        
        XCTAssertTrue(removed == 2)
    }
    
    // MARK: - LinkedList as Collection.
    func testLinkedListCollection() throws {
        var linkedList = LinkedList<Int>()
        
        for i in 0...9 {
            linkedList.append(i)
        }
        
        let sum = linkedList.reduce(0, +)
        XCTAssertEqual(sum, 45)
    }
    
    // MARK: - Queue Test with array.
    func testQueueArray() throws {
        var queue = Queue<String>()
        _ = queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        queue.dequeue()
        let peek = queue.peek
        XCTAssertEqual("Brian", peek)
    }
    
    // MARK: - Tree Test
    func testTree() throws {
        let tree = generateTree()
        XCTAssertNotNil(tree)
    }
    
    func testTreeSearch() throws {
        let tree = generateTree()
        let toSearch = "ginger ale"
        
        let searchResult = tree.search(toSearch)
        XCTAssertEqual(toSearch, searchResult?.value)
    }
    
    func testBinarySearchTree() throws {
        
    }
}

// MARK: - Auxilliary functions.
extension DataStructuresTests {
    func generateTree() -> TreeNode<String> {
        
        let tree = TreeNode("Beverages")
        
        let hot = TreeNode("hot")
        let cold = TreeNode("cold")
        
        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let chocolate = TreeNode("cocoa")
        
        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")
        
        let soda = TreeNode("soda")
        let milk = TreeNode("milk")
        
        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")
        
        tree.add(hot)
        tree.add(cold)
        
        hot.add(tea)
        hot.add(coffee)
        hot.add(chocolate)
        
        cold.add(soda)
        cold.add(milk)
        
        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)
        
        soda.add(gingerAle)
        soda.add(bitterLemon)
        
        return tree
    }
}
