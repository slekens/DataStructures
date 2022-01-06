import XCTest
@testable import DataStructures

final class DataStructuresTests: XCTestCase {
    
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
    
    // MARK: - LinkedList Tests
    func testLinkedList() throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        if let lastElement = linkedList.removeLast() {
            assert(3 == lastElement)
        }
    }
}
