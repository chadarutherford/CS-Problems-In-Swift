import XCTest
@testable import DoublyLinkedList

final class DoublyLinkedListTests: XCTestCase {
	
	var node: ListNode<Int>!
	var dll: DoublyLinkedList<Int>!
	
	override func setUp() {
		node = ListNode<Int>(1)
		dll = DoublyLinkedList<Int>(node)
	}
	
	func testListRemoveFromTail() {
		let _ = dll.removeFromTail()
		XCTAssertNil(dll.head)
		XCTAssertNil(dll.tail)
		XCTAssertEqual(dll.count(), 0)
		
		dll.addToTail(33)
		XCTAssertEqual(dll.head?.value, 33)
		XCTAssertEqual(dll.tail?.value, 33)
		XCTAssertEqual(dll.count(), 1)
		XCTAssertEqual(dll.removeFromTail(), 33)
		XCTAssertEqual(dll.count(), 0)
		
		dll.addToTail(68)
		XCTAssertEqual(dll.count(), 1)
		XCTAssertEqual(dll.removeFromTail(), 68)
		XCTAssertEqual(dll.count(), 0)
	}
	
	func testListRemoveFromHead() {
		let _ = dll.removeFromHead()
        XCTAssertNil(dll.head)
        XCTAssertNil(dll.tail)
		XCTAssertEqual(dll.count(), 0)

        dll.addToHead(2)
        XCTAssertEqual(dll.head?.value, 2)
        XCTAssertEqual(dll.tail?.value, 2)
		XCTAssertEqual(dll.count(), 1)
        XCTAssertEqual(dll.removeFromHead(), 2)
		XCTAssertEqual(dll.count(), 0)

        dll.addToHead(55)
		XCTAssertEqual(dll.count(), 1)
        XCTAssertEqual(dll.removeFromHead(), 55)
		XCTAssertEqual(dll.count(), 0)
	}
	
	func testListAddToTail() {
		XCTAssertEqual(dll.tail?.value, 1)
		XCTAssertEqual(dll.count(), 1)
		
		dll.addToTail(30)
        XCTAssertEqual(dll.tail?.prev?.value, 1)
        XCTAssertEqual(dll.tail?.value, 30)
		XCTAssertEqual(dll.count(), 2)
		
		dll.addToTail(20)
        XCTAssertEqual(dll.tail?.prev?.value, 30)
        XCTAssertEqual(dll.tail?.value, 20)
		XCTAssertEqual(dll.count(), 3)
	}
	
	func testNodeDelete() {
		let node1 = ListNode(3)
        let node2 = ListNode(4)
        let node3 = ListNode(5)

        node1.next = node2
        node2.next = node3
        node2.prev = node1
        node3.prev = node2

        node2.delete()

        XCTAssertEqual(node1.next, node3)
        XCTAssertEqual(node3.prev, node1)
	}
	
	func testNodeInsertBefore() {
		node.insertBefore(0)
		XCTAssertEqual(node.prev?.value, 0)
	}
	
	func testNodeInsertAfter() {
		node.insertAfter(2)
		XCTAssertEqual(node.next?.value, 2)
	}
	
	func testListAddToHead() {
		XCTAssertEqual(dll.head?.value, 1)
		dll.addToHead(10)
		XCTAssertEqual(dll.head?.value, 10)
		XCTAssertEqual(dll.head?.next?.value, 1)
		XCTAssertEqual(dll.count(), 2)
	}
	
	func testListMoveToEnd() {
		dll.addToHead(40)
		XCTAssertEqual(dll.tail?.value, 1)
		XCTAssertEqual(dll.head?.value, 40)
		
		dll.moveToEnd(dll.head!)
		XCTAssertEqual(dll.tail?.value, 40)
		XCTAssertEqual(dll.tail?.prev?.value, 1)
		XCTAssertEqual(dll.count(), 2)
		
		dll.addToTail(4)
		dll.moveToEnd(dll.head!.next!)
		XCTAssertEqual(dll.tail?.value, 40)
		XCTAssertEqual(dll.tail?.prev?.value, 4)
		XCTAssertEqual(dll.count(), 3)
	}
	
	func testListMoveToFront() {
		dll.addToTail(3)
		XCTAssertEqual(dll.head?.value, 1)
		XCTAssertEqual(dll.tail?.value, 3)
		
		dll.moveToFront(self.dll.tail!)
		XCTAssertEqual(dll.head?.value, 3)
		XCTAssertEqual(dll.head?.next?.value, 1)
		XCTAssertEqual(dll.count(), 2)
		
		dll.addToHead(29)
		dll.moveToFront(self.dll.head!.next!)
		XCTAssertEqual(self.dll.head?.value, 3)
		XCTAssertEqual(self.dll.head?.next?.value, 29)
		XCTAssertEqual(dll.count(), 3)
	}
	
	func testListDelete() {
		dll.delete(self.node)
		XCTAssertNil(dll.head)
		XCTAssertNil(dll.tail)
		XCTAssertEqual(dll.count(), 0)
		
		dll.addToTail(1)
		dll.addToHead(9)
		dll.addToTail(6)
		
		dll.delete(dll.head)
		XCTAssertEqual(dll.head?.value, 1)
		XCTAssertEqual(dll.tail?.value, 6)
		XCTAssertEqual(dll.count(), 2)
		
		dll.delete(dll.head)
		XCTAssertEqual(self.dll.head?.value, 6)
		XCTAssertEqual(self.dll.tail?.value, 6)
		XCTAssertEqual(dll.count(), 1)
	}
	
	func testGetMax() {
		XCTAssertEqual(dll.getMax(), 1)
		dll.addToTail(100)
		XCTAssertEqual(dll.getMax(), 100)
		dll.addToTail(55)
		XCTAssertEqual(dll.getMax(), 100)
		dll.addToTail(101)
		XCTAssertEqual(dll.getMax(), 101)
	}
}
