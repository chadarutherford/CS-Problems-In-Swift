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
		let bst2 = BSTNode<Int>(1)
		bst2.insert(1)
		XCTAssertEqual(bst2.right?.value, 1)
	}
	
	func testContains() {
		bst.insert(2)
		bst.insert(3)
		bst.insert(7)
		XCTAssertTrue(bst.contains(7))
		XCTAssertFalse(bst.contains(8))
	}
	
	func testGetMax() {
		XCTAssertEqual(bst.getMax(), 5)
		bst.insert(30)
		XCTAssertEqual(bst.getMax(), 30)
		bst.insert(300)
		bst.insert(3)
		XCTAssertEqual(bst.getMax(), 300)
	}
	
	func testForEach() {
		var arr = [Int]()
		let fn = { arr.append($0) }
		
		let v1 = Int.random(in: 1 ... 101)
		let v2 = Int.random(in: 1 ... 101)
		let v3 = Int.random(in: 1 ... 101)
		let v4 = Int.random(in: 1 ... 101)
		let v5 = Int.random(in: 1 ... 101)
		
		bst.insert(v1)
		bst.insert(v2)
		bst.insert(v3)
		bst.insert(v4)
		bst.insert(v5)
		
		bst.forEach(fn)
		
		XCTAssertTrue(arr.contains(5))
		XCTAssertTrue(arr.contains(v1))
		XCTAssertTrue(arr.contains(v2))
		XCTAssertTrue(arr.contains(v3))
		XCTAssertTrue(arr.contains(v4))
		XCTAssertTrue(arr.contains(v5))
	}
}
