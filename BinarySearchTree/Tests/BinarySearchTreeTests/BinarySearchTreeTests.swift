import XCTest
@testable import BinarySearchTree

final class BinarySearchTreeTests: XCTestCase {
	var bst: BSTNode<Int>!
	
	override func setUp() {
		bst = BSTNode<Int>(5)
	}
	
	func testInsert() {
		bst.insert(2)
		bst.insert(3)
		bst.insert(7)
		bst.insert(6)
		XCTAssertEqual(bst.left?.right?.value, 3)
		XCTAssertEqual(bst.right?.left?.value, 6)
	}
	
	func testHandleDuplicateInsert() {
		
	}
}
