import XCTest
@testable import LinkedList

final class StackTests: XCTestCase {
	
	func testCountReturns0ForEmptyLLStack() {
		let stack = LinkedListStack<Int>()
		XCTAssertEqual(stack.count(), 0)
	}
	
	func testCountReturns0ForEmptyArrayStack() {
		let stack = ArrayStack<Int>()
		XCTAssertEqual(stack.count(), 0)
	}
	
	func testCountReturnsCorrectLengthAfterArrayPush() {
		let stack = ArrayStack<Int>()
		XCTAssertEqual(stack.count(), 0)
		stack.push(2)
		XCTAssertEqual(stack.count(), 1)
		stack.push(4)
		XCTAssertEqual(stack.count(), 2)
		stack.push(6)
		stack.push(8)
		stack.push(10)
		stack.push(12)
		stack.push(14)
		stack.push(16)
		stack.push(18)
		XCTAssertEqual(stack.count(), 9)
	}
	
	func testCountReturnsCorrectLengthAfterLLPush() {
		let stack = LinkedListStack<Int>()
		XCTAssertEqual(stack.count(), 0)
		stack.push(2)
		XCTAssertEqual(stack.count(), 1)
		stack.push(4)
		XCTAssertEqual(stack.count(), 2)
		stack.push(6)
		stack.push(8)
		stack.push(10)
		stack.push(12)
		stack.push(14)
		stack.push(16)
		stack.push(18)
		XCTAssertEqual(stack.count(), 9)
	}
	
	func testEmptyArrayPop() {
		let stack = ArrayStack<Int>()
		XCTAssertNil(stack.pop())
		XCTAssertEqual(stack.count(), 0)
	}
	
	func testEmptyLLPop() {
		let stack = LinkedListStack<Int>()
		XCTAssertNil(stack.pop())
		XCTAssertEqual(stack.count(), 0)
	}
	
	func testLLPopRespectsOrder() {
		let stack = LinkedListStack<Int>()
		stack.push(100)
		stack.push(101)
		stack.push(105)
		XCTAssertEqual(stack.pop(), 105)
		XCTAssertEqual(stack.count(), 2)
		XCTAssertEqual(stack.pop(), 101)
		XCTAssertEqual(stack.count(), 1)
		XCTAssertEqual(stack.pop(), 100)
		XCTAssertEqual(stack.count(), 0)
		XCTAssertNil(stack.pop())
		XCTAssertEqual(stack.count(), 0)
	}
	
	func testArrayPopRespectsOrder() {
		let stack = ArrayStack<Int>()
		stack.push(100)
		stack.push(101)
		stack.push(105)
		XCTAssertEqual(stack.pop(), 105)
		XCTAssertEqual(stack.count(), 2)
		XCTAssertEqual(stack.pop(), 101)
		XCTAssertEqual(stack.count(), 1)
		XCTAssertEqual(stack.pop(), 100)
		XCTAssertEqual(stack.count(), 0)
		XCTAssertNil(stack.pop())
		XCTAssertEqual(stack.count(), 0)
	}
}
